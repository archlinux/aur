# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=aftp-server
pkgname=${_pkgname}-git
pkgver=v2.0.r0.gd35a8d1
pkgrel=1
pkgdesc="Very fast file transfering server"
arch=(i686 x86_64)
url="https://github.com/arthurzam/${_pkgname}"
license=('GPL2')
depends=('openssl')
source=("${_pkgname}::git+git://github.com/arthurzam/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
  cd "${srcdir}/${_pkgname}"
  make
}
 
package() {
  install -Dm 755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "${srcdir}/${_pkgname}/man.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
  gzip "$pkgdir/usr/share/man/man1/${_pkgname}.1"
}

