# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=checkpolicy
pkgver=2.3
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
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20140506/${pkgname}-${pkgver}.tar.gz")
sha256sums=('90632d11afecb66997971d4c5c5d70dfb02d3969ec610ee2918ba6df99c8207b')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m 0755 test/dismod "${pkgdir}"/usr/bin/sedismod
  install -m 0755 test/dispol "${pkgdir}"/usr/bin/sedispol
}
