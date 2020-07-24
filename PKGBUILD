# Maintainer: Martin Thierer <thierer@web.de>

pkgname=nibtools-git
_pkgname=nibtools
pkgver=r634.77ec1e1
pkgrel=1
pkgdesc="Commodore 1541/1571 disk image nibbler"
arch=('i686' 'x86_64')
url="https://c64preservation.com/dp.php?pg=nibtools"
license=('unknown')
depends=('opencbm')
makedepends=('git' 'cc65')
provides=('nibtools')
source=('git+https://github.com/OpenCBM/nibtools.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make -f GNU/Makefile CBM_LNX_PATH=/usr linux
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 -t $pkgdir/usr/bin nibread nibwrite nibscan nibconv nibrepair nibsrqtest
}
