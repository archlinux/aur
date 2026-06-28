# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pear-desktop-bin
_app_id=com.github.th-ch.youtube-music
pkgver=3.12.0
pkgrel=1
pkgdesc="YouTube Music Desktop App - including custom plugins"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pear-devs/pear-desktop"
license=('MIT')
depends=(
  'gtk3'
  'libsecret'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'youtube-music')
install='youtube-music.install'
source=( "license-$pkgver::https://github.com/pear-devs/pear-desktop/raw/v$pkgver/license"
        'youtube-music.sh')
source_x86_64=("https://github.com/pear-devs/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/pear-devs/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/pear-devs/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_armv7l.deb")
sha256sums=('abc6a246b20c0106c9bbe9c31e65f10f5e2b2d28d7a72349b4f5095e86c22524'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')
sha256sums_x86_64=('cbf8996f565cbe01cd3a37cc9df0e52da3dcc3b889541117b512be7e4f2afde3')
sha256sums_aarch64=('02427b3e1cec7aab24dbc653b3a12a0efa77fc8e5147b13e1f012bfa5e535ce8')
sha256sums_armv7h=('ba41327129a34edc72f8457acd6de037608d7cb65ad49a9e22a32df1cfc412e6')

package() {
  bsdtar xfv data.tar.xz -C "$pkgdir"

  desktop-file-edit --set-key=Exec --set-value="youtube-music %U" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"

  install -d "$pkgdir/etc/apparmor.d"
    ln -s "/opt/YouTube Music/resources/apparmor-profile" \
      "$pkgdir/etc/apparmor.d/youtube-music"

  install -Dm755 youtube-music.sh "$pkgdir/usr/bin/youtube-music"

  install -Dm644 "license-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/license"
}
