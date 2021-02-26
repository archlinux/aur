# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=elfparser-git
pkgver=r7.39d21ca
pkgrel=1
pkgdesc='Provides basic information and static analysis of an ELF binary.'
arch=('any')
url='https://github.com/jacob-baines/elfparser'
license=('GPL3')
depends=('boost')
makedepends=('cmake' 'make' 'git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/jacob-baines/elfparser.git")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${pkgname}"

    mkdir build
    cd build
    cmake ..
    make
}
check() {
    cd "${pkgname}"

    cd build
    ./elfparser-cli_test
}
package() {
    cd "${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 build/./elfparser-cli "${pkgdir}/usr/bin/elfparser"
}