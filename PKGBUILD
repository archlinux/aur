# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=checkpolicy
pkgver=2.2
pkgrel=2
pkgdesc="SELinux policy compiler"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('libsepol' 'libselinux')
#makedepends=('selinux-flex')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
source=("http://userspace.selinuxproject.org/releases/20131030/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9ff6698f4d4cb59c9c916e348187d533ada4107f90c253ef7304905934e9adf8')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package(){
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m 0755 test/dismod "${pkgdir}"/usr/bin/sedismod
  install -m 0755 test/dispol "${pkgdir}"/usr/bin/sedispol
}
