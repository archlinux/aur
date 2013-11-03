# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsepol
pkgver=2.2
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('glibc')
options=(staticlibs)
source=("http://userspace.selinuxproject.org/releases/20131030/${pkgname}-${pkgver}.tar.gz")
sha256sums=('77a4b27006295805bdbd7f240038cb32a49be1d60847d413899501702933fc0f')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package(){
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install

  # /lib/lisepol.so fix
  cd "${pkgdir}"/usr/lib
  rm libsepol.so
  ln -s libsepol.so.1 libsepol.so
}
