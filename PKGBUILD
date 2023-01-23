# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer
_pkgname=MIDIVisualizer
pkgver=7.0
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=('x86_64')
url='https://github.com/kosua20/MIDIVisualizer'
license=('MIT')
depends=('gtk3' 'ffmpeg')
# TODO unbundle glfw, libnfd
makedepends=('cmake' 'gendesk')
source=("$pkgname::git+https://github.com/kosua20/MIDIVisualizer")
sha256sums=('SKIP')

prepare() {
  gendesk -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --name "$_pkgname" -f
}

build() {
  cmake -B build -S "$pkgname" -Wno-dev
  make -C build
}

package() {
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "resources/icon/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
