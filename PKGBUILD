# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm-git
pkgrel=1
pkgver=1.0_6_g6e3c8e4
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}::git+https://src.clttr.info/rwa/cgmnlm.git")
conflicts=('gmni-git' 'cgmnlm')
depends=('bearssl')
optdepends=('xdg-utils')
makedepends=('git' 'scdoc')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
	printf "r%s_%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/"

    mkdir -p build && cd build
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
