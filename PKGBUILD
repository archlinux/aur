# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm-git
pkgrel=1
pkgver=1.5
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://sr.ht/~rwa/gemini-clients/"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}::git+https://git.sr.ht/~rwa/cgmnlm")
conflicts=('gmni' 'gmni-git' 'cgmnlm')
provides=('cgmnlm')
depends=('bearssl')
optdepends=('xdg-utils')
makedepends=('git' 'scdoc')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    printf "%s" "$(git describe | sed -r 's/\-/_/g' )"
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
