#
# Maintainer: Marcel Bobolz <eyed3v@keemail.me>
#
_pkgname=asmc
pkgname=${_pkgname}
pkgver=2.39
pkgrel=1
pkgdesc="asmc - MASM compatible assembler"
arch=('x86_64')
url="https://github.com/nidud/asmc"
license=('GPL')
makedepends=('bison' 'git' 'make')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "LICENSE"
    "makefile.x86_64"
    "master.tar.gz::https://github.com/nidud/asmc/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '6bae842f78c8eb13851884fe2dcb3460e18d3215bcc0e3ea2a11b934a0def01e'
    '97a21cb5fe5ba73c069fd8d9a467f7642b28cf2ab057ad799cb8bd73d6ba6127'
    'a0bfef8b05d3bb1857aad940b96be07372d518ca0280515ad128f8039d548fad'
)

prepare() {
    install -vm0666 "${source[0]}" "${pkgname}-${pkgver}/source/asmc/makefile"
}

build() {
	cd "${pkgname}-${pkgver}/source/asmc"
	make -j$(nproc) all
}

package() {
	cd "${pkgname}-${pkgver}/source/asmc"
	make DESTDIR="${pkgdir}/" install
}