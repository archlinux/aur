# Maintainer: kylon
pkgbase="pqhex"
pkgname="pqhex-git"
pkgver=1.2.d55a245
_version=1.2
pkgrel=1
pkgdesc="The Pokemon Quest save editor"
url="https://github.com/kylon/PQHex"
arch=("x86_64")
depends=("qt6-base")
makedepends=(
    "git"
    "cmake"
)
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "git+https://github.com/kylon/PQHex.git"
    'pqhex.ico'
    'pqhex.desktop'
)
sha256sums=(
    'SKIP'
    '8b3742983ea97064c8d635f7571cbd6a4be428b5ffb64a436b805d2d1efac52b'
    '0295aac00eb2f6d86d3555fe40b8efc0fcd7d68104a049aec86078fc0fb0285c'
)

pkgver() {
    cd "${srcdir}/PQHex"
    printf "%s.%s" "${_version}" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S PQHex -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -Dm755 ${srcdir}/build/PQHex -t "${pkgdir}/usr/bin/"
    install -Dm644 ${srcdir}/pqhex.ico -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    install -Dm644 pqhex.desktop -t "${pkgdir}/usr/share/applications/"
}
