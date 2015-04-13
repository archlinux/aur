# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=checkpolicy
pkgver=2.4
pkgrel=1
pkgdesc="SELinux policy compiler"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
depends=('libsepol' 'libselinux>=2.4')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
options=(!emptydirs)
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20150202/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9bbdac28a88de4c405c769730863f3adcd266adbfa45881a5de67e3a4895bcd4')

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
