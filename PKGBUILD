# Maintainer: fft
# Contributor: George Stelle <stelleg@gmail.com>
pkgname=argobots-git
pkgver=v1.2.r4.gbb6faac
pkgrel=1
pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgdesc='Lightweight, low-level threading and tasking framework'
arch=('x86_64')
url="argobots.org"
license=('LicenseRef-UChicago-Argonne')
source=("${pkgname}"::git+https://github.com/pmodels/argobots.git)
md5sums=('SKIP')
makedepends=(automake autoconf git libtool)

build() {
  cd "${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}/test"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
