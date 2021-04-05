# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer
_upstreampkgname=MIDIVisualizer
pkgver=6.3
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=('x86_64')
url='https://github.com/kosua20/MIDIVisualizer'
license=('MIT')
depends=('gtk3' 'ffmpeg')
makedepends=('cmake')
source=("$_upstreampkgname-$pkgver.tar.gz::https://github.com/kosua20/$_upstreampkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cda3900ae3f4f6032669c3eae713dfd2afd9474ca8fb926bf30d87052bfd9542')

build() {
  cmake -B build -S "$_upstreampkgname-$pkgver" \
    -Wno-dev
  make -C build
}

package() {
  install -Dm755 "build/$_upstreampkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$_upstreampkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for doc in README.md result{1,2,3}.png; do
    install -Dm644 "$doc" -t "$pkgdir/usr/share/doc/$pkgname"
  done
}
# vim:set ts=2 sw=2 et:
