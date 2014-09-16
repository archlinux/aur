# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=libsemanage
pkgver=2.3
pkgrel=2
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('ustr' 'libselinux>=2.1.0' 'audit')
options=(!emptydirs)
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20140506/${pkgname}-${pkgver}.tar.gz")
sha256sums=('03e09e35e611c286e446bef92b6023ef2623815996f5a53394bb02e49a312e4b')

build() {
  cd "${pkgname}-${pkgver}"
  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python3 install-pywrap
}
