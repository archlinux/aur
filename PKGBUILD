# Maintainer: emsger <earthmessenger@qq.com>
# With help of AI

pkgname=pear-desktop-michei69-bin
_app_id=com.github.th-ch.youtube-music
pkgver=3.12.2
pkgrel=1
pkgdesc="YouTube Music Desktop App - including custom plugins (michei69's fork)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/michei69/pear-desktop"
license=('MIT')
# 预编译二进制无调试符号，不生成 -debug 子包（也避免与上游 pear-desktop-bin-debug 文件冲突）
options=('!debug')
makedepends=('desktop-file-utils')
depends=(
  'gtk3'
  'libsecret'
  'nss'
)
provides=('pear-desktop' 'youtube-music')
conflicts=('pear-desktop' 'youtube-music' 'pear-desktop-bin' 'pear-desktop-git')
install='youtube-music.install'
source=("license-$pkgver::https://github.com/michei69/pear-desktop/raw/v$pkgver/license"
        'youtube-music.sh')
source_x86_64=("https://github.com/michei69/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/michei69/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/michei69/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_armv7l.deb")
sha256sums=('34166a5d4f182354810c18c9d568cbdd2b8ef7e95fa71d31f1d00fbe1089ac81'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')
sha256sums_x86_64=('43ee428aac927ab139cedee8aa855086015f3d9e12775923349a8328196544ca')
sha256sums_aarch64=('2e92dc6d607bfc2b7de497f91aca9d9edc35912236d92a5744775874296e7d0d')
sha256sums_armv7h=('59ccd3e3b03b14059a278763a703be77748c9051a501c3188928e03aa33d8a1e')

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
