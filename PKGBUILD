# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >

pkgname=emojicode
pkgver=0.6.0
pkgrel=3
pkgdesc="An open-source, full-blown programming language consisting of emojis"
arch=('i686' 'x86_64')
url="https://emojicode.org"
license=("custom")
depends=("ncurses")
makedepends=("llvm" "cmake>=3.5.1" "ninja" "gcc>=7.2" "python>=3.5.2")
checkdepends=("python>=3.5.2")
source=("${pkgname}::git+https://github.com/emojicode/emojicode")
md5sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}"

    mkdir -p build
    cd build
    cmake .. -GNinja

    ninja
}

check() {
    cd "${srcdir}/${pkgname}/build"
    ninja tests
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${pkgname}/build"
    ninja dist

    cd "Emojicode-0.6.0-Linux-${CARCH}"

    install -Dm755 "emojicodec" "${pkgdir}/usr/bin/emojicodec"

    install -Dm644 "include/runtime/Runtime.h" "${pkgdir}/usr/local/include/emojicode/runtime/Runtime.h"
    install -Dm644 "include/s/Data.h" "${pkgdir}/usr/local/include/emojicode/s/Data.h"
    install -Dm644 "include/s/String.h" "${pkgdir}/usr/local/include/emojicode/s/String.h"

    install -Dm755 "packages/files/interface.emojii" "${pkgdir}/usr/local/EmojicodePackages/files/interface.emojii"
    install -Dm755 "packages/files/libfiles.a" "${pkgdir}/usr/local/EmojicodePackages/files/libfiles.a"
    install -Dm755 "packages/runtime/libruntime.a" "${pkgdir}/usr/local/EmojicodePackages/runtime/libruntime.a"
    install -Dm755 "packages/s/interface.emojii" "${pkgdir}/usr/local/EmojicodePackages/s/interface.emojii"
    install -Dm755 "packages/s/libs.a" "${pkgdir}/usr/local/EmojicodePackages/s/libs.a"
    install -Dm755 "packages/sockets/interface.emojii" "${pkgdir}/usr/local/EmojicodePackages/sockets/interface.emojii"
    install -Dm755 "packages/sockets/libsockets.a" "${pkgdir}/usr/local/EmojicodePackages/sockets/libsockets.a"
}
