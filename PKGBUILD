# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=udr-git
pkgver=v0.9.4.r23.g774f2e7
pkgrel=1
pkgdesc="A UDT wrapper for rsync that improves throughput of large dataset transfers over long distances."
arch=('x86_64')
url="http://www.labcomputing.org/"
license=(APACHE)
depends=(openssl crypto++ rsync udt)
makedepends=(git)
checkdepends=(python-pytest)
provides=(udr)
conflicts=(udr)
source=('git+https://github.com/martinetd/UDR.git')
sha256sums=('SKIP')

pkgver() {
  cd UDR
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd UDR
}

build() {
  cd UDR
  make -j1  # multithread build fails
}

check() {
  cd UDR
  #pytest -vv tests  # broken
}

package() {
  cd UDR
  install -m755 -Dt "${pkgdir}"/usr/bin/ src/udr
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim:set ts=2 sw=2 et:
