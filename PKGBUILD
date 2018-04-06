# Maintainer: Tiago Koji Castro Shibata <tiago.shibata@gmail.com>
pkgname=archc-git
pkgver=2.4.1.r71.gf0b697c
pkgrel=1
pkgdesc='A powerful and modern open-source architecture description language'
arch=('x86_64' 'i686')
url='https://github.com/ArchC/ArchC'
license=('GPL')
depends=('bash')
makedepends=('git' 'systemc')
provides=('archc')
conflicts=('archc')
source=('git+https://github.com/ArchC/ArchC.git')
md5sums=('SKIP')

pkgver() {
  cd ArchC
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ArchC
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ArchC
  make prefix=$pkgdir/usr sysconfdir=$pkgdir/etc install
  rm $pkgdir/etc/env.sh  # Unneeded for a system wide install
}
