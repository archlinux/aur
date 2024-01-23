# Maintainer: taotieren <admin@taotieren.com>

pkgname=mesaflash-git
pkgver=3.4.9.r9.gaef5246
pkgrel=7
pkgdesc="Configuration and diagnostic tool for Mesa Electronics PCI(E)/ETH/EPP/USB/SPI boards"
arch=('i686' 'x86_64')
url="https://github.com/LinuxCNC/mesaflash"
license=('GPL-2.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(libmd
        pciutils)
makedepends=(git)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's|^release/||g;s/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    make
}

package() {
    cd "${srcdir}/${pkgname}/"
    make DESTDIR="$pkgdir/usr" install
}
