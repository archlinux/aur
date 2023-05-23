# Maintainer: Alexander Rosenberg <zanderpkg at pm dot me>

_pkgname='nvramtool'
pkgname=$_pkgname-git
pkgver=4.20.78.g78881e1006
pkgrel=1
pkgdesc='Reads and writes coreboot parameters and displays information from the coreboot table in CMOS/NVRAM'
url='https://coreboot.org'
arch=('x86_64')
license=('GPL2')
provides=('nvramtool')
makedepends=('git')
source=('git+https://github.com/coreboot/coreboot.git')
sha256sums=('SKIP')

pkgver(){
  cd "coreboot"
  git describe --tags --long | sed 's#-#.#g'
}

build() {
    make -C 'coreboot/util/nvramtool'
}

package() {
    install -Dt "$pkgdir/usr/bin/" "coreboot/util/nvramtool/nvramtool"
    install -Dt "$pkgdir/usr/share/man/man8" "coreboot/util/nvramtool/cli/nvramtool.8"
}
