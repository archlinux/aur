# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer-git
pkgver=4.1.r6.g5dc541a
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=('x86_64')
url='https://github.com/kosua20/MIDIVisualizer'
license=('MIT')
provides=("${pkgname%-git}")
depends=('gtk3')
makedepends=('cmake')
source=("${pkgname%-git}::git+https://github.com/kosua20/MIDIVisualizer")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${pkgname%-git}/build"
  make -j `nproc`
}

package() {
  cd "${pkgname%-git}/build"
  install -Dm755 MIDIVisualizer "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: