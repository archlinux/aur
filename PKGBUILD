# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm-git
pkgrel=1
pkgver=r173.7e4e43b
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("cgmnlm::git+https://src.clttr.info/rwa/cgmnlm.git")
conflicts=('gmni-git')
depends=('bearssl')
makedepends=('git' 'scdoc')
sha256sums=('SKIP')

pkgver() {
    cd cgmnlm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd cgmnlm

    mkdir build && cd build
    # errors? what errors :)
    CFLAGS=-Wno-error ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd cgmnlm/build
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
