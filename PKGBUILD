# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer
_upstreampkgname=MIDIVisualizer
pkgver=6.4
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=('x86_64')
url='https://github.com/kosua20/MIDIVisualizer'
license=('MIT')
depends=('gtk3' 'ffmpeg')
makedepends=('cmake')
source=("$_upstreampkgname-$pkgver.tar.gz::https://github.com/kosua20/$_upstreampkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad08ab49fed6c845ff692dc59577a15b074f478c83c726fd828c7844158ce6ec')

build() {
  cmake -B "$_upstreampkgname-$pkgver/build" -S "$_upstreampkgname-$pkgver" \
    -Wno-dev
  make -C "$_upstreampkgname-$pkgver/build" 
}

package() {
  install -Dm755 "$_upstreampkgname-$pkgver/build/$_upstreampkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$_upstreampkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for doc in README.md result{1,2,3}.png; do
    install -Dm644 "$doc" -t "$pkgdir/usr/share/doc/$pkgname"
  done
}
# vim:set ts=2 sw=2 et:
