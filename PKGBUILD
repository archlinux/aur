pkgname=swconfig-git
_pkgname=swconfig
pkgver=20150806.4.g43e2854
pkgrel=3
pkgdesc="project to package the swconfig utility from OpenWRT for archlinuxarm on BPi-R1"
url="https://github.com/rains31/swconfig"
license=('GPL2')
depends=('libnl')
makedepends=('git' 'gcc' 'linux-headers')
provides=(${pkgname})
conflicts=(${pkgname})
options=()
arch=('armv6h' 'armv7h')
source=(git+https://github.com/rains31/${_pkgname}.git)
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"
  CFLAGS=$CFLAGS" -I /usr/include/libnl3/ -I /lib/modules/`uname -r`/build -I ."
  make
  make install DESTDIR=$pkgdir
} 
