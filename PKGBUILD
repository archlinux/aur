# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer-git
_pkgname=midivisualizer
pkgver=6.3.r2.gedb52a8
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=('x86_64')
url='https://github.com/kosua20/MIDIVisualizer'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gtk3' 'ffmpeg')
makedepends=('cmake' 'git')
source=("$_pkgname::git+https://github.com/kosua20/MIDIVisualizer")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -Wno-dev
  make -C build
}

package() {
  install -Dm755 build/MIDIVisualizer "$pkgdir/usr/bin/$_pkgname"

  cd "$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for doc in README.md result{1,2,3}.png; do
    install -Dm644 "$doc" -t "$pkgdir/usr/share/doc/$_pkgname"
  done
}
# vim:set ts=2 sw=2 et:
