# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuc970-nuwriter-git
pkgver=1328b10
pkgrel=1
epoch=
pkgdesc="The Nu-writer Command Tool is a linux console application consisting of functions to access storage(eg. DRAM,NAND,SPINOR,SPINAND,SD) in a NUC970 family processors"
arch=('any')
url="https://gitee.com/OpenNuvoton/NUC970_NuWriter_CMD"
license=('GPL3')
groups=()
depends=('libusb')
makedepends=("gcc" "git" "automake" "pkgconfig")
checkdepends=()
optdepends=()
provides=('NUC970_NuWriter_CMD')
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/V//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    autoreconf -f -i
    ./configure
#     ./configure --prefix=$PWD/install
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
#     make install
    install -Dm0755 "nuwriter" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0755 "99-nuvoton_isp.rules" "${pkgdir}/usr/lib/udev/rules.d/99-nuvoton_isp.rules"
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-git}"
    cp -rv nudata "${pkgdir}/usr/share/${pkgname%-git}"
}
