# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=mcjoin-git
_pkgname=mcjoin
pkgver=v2.12.r2.2bc37c7
pkgrel=1

pkgdesc="A simple and easy-to-use tool to test IPv4 and IPv6 multicast"
arch=('x86_64')
url='https://github.com/troglobit/mcjoin'
license=('ISC')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install-strip
  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "../../doc/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et
