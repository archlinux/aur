# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pear-desktop-bin
_app_id=com.github.th-ch.youtube-music
pkgver=3.12.1
pkgrel=1
pkgdesc="YouTube Music Desktop App - including custom plugins"
arch=('x86_64' 'aarch64')
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
sha256sums=('abc6a246b20c0106c9bbe9c31e65f10f5e2b2d28d7a72349b4f5095e86c22524'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')
sha256sums_x86_64=('be08b48dd9d43c8c468e06890dc84cce2950f93d38b4b854d5ccaf0e4127b2d6')
sha256sums_aarch64=('3987bad0b7c1b5aedb5f5b7965fd41cd3ea714de6ee6d6b78bd3ebe7d09f82a1')

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
