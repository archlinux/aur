# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=speedynote-bin
_tagname='0.12.2'
pkgver=${_tagname//-/.}
pkgrel=1
pkgdesc="A simple note app with good performance and PDF import support"
arch=('x86_64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'poppler-qt6' 'sdl2-compat' 'glibc' 'gcc-libs')
provides=('speedynote')
conflicts=('speedynote' 'speedynote-git')
source=("$pkgname-$pkgver.deb::https://github.com/alpha-liu-01/SpeedyNote/releases/download/v$_tagname/speedynote_${_tagname}-1_amd64.deb"
        "LICENSE-$_tagname::https://raw.githubusercontent.com/alpha-liu-01/SpeedyNote/v$_tagname/LICENSE")
sha256sums=('ef90a607af559ca70c40cbb3c5e3da5a47cb71038fb8932a53a59dbeff4fd771'
            '36273406b3d0ea68274d369dcf48167a3cef8660beddb30f5dfbee9ba75a45d7')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar -xf "data.tar.zst" -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  # binary
  install -Dm755 "usr/bin/speedynote" "$pkgdir/usr/bin/speedynote"
  # desktop file
  install -Dm644 "usr/share/applications/speedynote.desktop" "$pkgdir/usr/share/applications/speedynote.desktop"
  # icon
  install -Dm644 "usr/share/pixmaps/speedynote.png" "$pkgdir/usr/share/pixmaps/speedynote.png"
  # doc
  install -Dm644 "usr/share/doc/speedynote/README.md" "$pkgdir/usr/share/doc/speedynote/README.md"
  # license
  install -Dm644 "$srcdir/LICENSE-$_tagname" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
