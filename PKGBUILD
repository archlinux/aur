# Maintainer: Jan Samek <samekh@email.cz>

_gitname=SF100Linux
pkgname=sf100linux-git
pkgver=1.2.1.03.r31.g7d8be06
pkgrel=4
pkgdesc='Linux software (dpcmd) for Dediprog SF100 and SF600 SPI flash programmers'
arch=('x86_64')
url="https://github.com/DediProgSW/SF100Linux"
license=('GPL2')
depends=('libusb-compat')
provides=('sf100linux')
conflicts=('sf100linux')
makedepends=('git')
source=(
    "git+https://github.com/DediProgSW/${_gitname}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
    make clean
    make
}

package() {
    cd "${_gitname}"
    install -Dm 755 dpcmd "$pkgdir"/usr/bin/dpcmd
    install -Dm 644 ChipInfoDb.dedicfg "$pkgdir"/usr/bin/ChipInfoDb.dedicfg
    install -Dm 644 60-dediprog.rules "$pkgdir"/usr/lib/udev/rules.d/60-dediprog.rules
}
