# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=libsepol
pkgver=2.3
pkgrel=2
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('glibc')
options=(staticlibs)
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20140506/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cc8d8642c3b7b95d6928d65dcbca2ab0627abc1c05166637851e63c1a6eae68f')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package(){
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install

  # Those are removed in Fedora
  rm -r "${pkgdir}"/usr/bin/chkcon "${pkgdir}"/usr/share/man

  # /lib/lisepol.so fix
  cd "${pkgdir}"/usr/lib
  rm libsepol.so
  ln -s libsepol.so.1 libsepol.so
}
