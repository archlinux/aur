# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
_pkgname=asio
pkgname="${_pkgname}-latest"
pkgdesc="Cross-platform C++ library for ASynchronous network I/O (1.11 branch)"
pkgver=1.11.0.r161.g14db6371
pkgrel=4
arch=('any')
url="https://think-async.com/Asio"
license=('custom:boost')
makedepends=('git' 'boost')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/chriskohlhoff/${_pkgname}#commit=14db6371b338339383aacaed29b0fa352259645a")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^asio.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
