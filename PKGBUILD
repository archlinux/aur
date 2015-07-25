# Maintainer: Oliver Mader <b52@reaktor42.de>

pkgname=libcmaes
pkgver=0.9.5
pkgrel=1
pkgdesc="libcmaes is a multithreaded C++11 library with Python bindings for high performance blackbox stochastic optimization using the CMA-ES algorithm for Covariance Matrix Adaptation Evolution Strategy."
url="https://github.com/beniz/libcmaes"
arch=('x86_64' 'i686')
license=('LGPLv3')
depends=('eigen')
optdepends=('boost')
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("https://github.com/beniz/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ab89fde799f1e938ffd74fa66ab77153')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --with-prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir/usr/bin/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
