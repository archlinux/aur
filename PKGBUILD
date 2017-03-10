# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=inspectrum-git
pkgver=r309.748dc33
pkgrel=2
pkgdesc="SDR signal analyzer"
arch=('any')
url="https://github.com/miek/inspectrum"
license=(GPL)
depends=('qt5-base' 'fftw' 'liquid-dsp-git')
conflicts=('inspectrum')
provides=('inspectrum')
makedepends=('cmake' 'pkg-config')
source=("$pkgname::git+https://github.com/miek/inspectrum")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
