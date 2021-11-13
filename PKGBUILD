# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer
_upstreampkgname=MIDIVisualizer
pkgver=6.5
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=('x86_64')
url='https://github.com/kosua20/MIDIVisualizer'
license=('MIT')
depends=('gtk3' 'ffmpeg')
makedepends=('cmake' 'gendesk')
source=("$_upstreampkgname-$pkgver.tar.gz::https://github.com/kosua20/$_upstreampkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('09e703e30603766122ee8594dc25f1398e49becce268f944a1b426621a9a1d7e')

prepare() {
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "$_upstreampkgname"
}

build() {
  cmake -B "$_upstreampkgname-$pkgver/build" -S "$_upstreampkgname-$pkgver" \
    -Wno-dev
  make -C "$_upstreampkgname-$pkgver/build" 
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd "$_upstreampkgname-$pkgver"
  install -Dm755 "build/$_upstreampkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "resources/icon/$_upstreampkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
# vim:set ts=2 sw=2 et:
