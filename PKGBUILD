# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuc980-nuwriter-git
pkgver=b7ef934
pkgrel=1
epoch=
pkgdesc="The Nu-writer Command Tool is a linux console application consisting of functions to access storage(eg. DRAM,NAND,SPINOR,SPINAND,SD) in a NUC980 family processors"
arch=('any')
url="https://gitee.com/OpenNuvoton/NUC980_NuWriter_CMD"
license=('GPL3')
groups=()
depends=('libusb')
makedepends=("gcc" "git" "automake" "pkgconfig")
checkdepends=()
optdepends=()
provides=('NUC980_NuWriter_CMD')
conflicts=(${pkgname%-git})
replaces=("nuwriter-git")
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
#     ./configure --prefix=$PWD/install
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
#     make install
    install -Dm0755 nuwriter "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0755 run.ini "${pkgdir}/usr/share/nudata/run.ini"
    cp -rv nudata "${pkgdir}/usr/share/"
}
