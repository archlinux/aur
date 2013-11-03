# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsemanage
pkgver=2.2
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('ustr' 'libselinux>=2.1.0' 'audit')
options=(!emptydirs)
 source=("http://userspace.selinuxproject.org/releases/20131030/${pkgname}-${pkgver}.tar.gz")
sha256sums=('11f60bfa0f1c6063cd9bd99ce0cb4acc9d6d9e9b8d7743d39e847bcd7803bd75')

build() {
  cd ${pkgname}-${pkgver}
  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
}

package(){
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python3 install-pywrap
}
