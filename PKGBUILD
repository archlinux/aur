# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=checkpolicy
pkgver=2.7
pkgrel=1
pkgdesc="SELinux policy compiler"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL2')
groups=('selinux')
makedepends=('libsepol>=2.7')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5413479f1dcde866c19896b4dbfec315d822aa431606e1d03c944408984c3201')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBSEPOLA=/usr/lib/libsepol.a install
  install -m 0755 test/dismod "${pkgdir}"/usr/bin/sedismod
  install -m 0755 test/dispol "${pkgdir}"/usr/bin/sedispol
}
