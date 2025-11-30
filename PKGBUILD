# Maintainer: kylon
pkgbase="pqhex"
pkgname="pqhex-git"
pkgver=v1.0.5f69ed1
_version="1.0"
pkgrel=2
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
    "pqhex::git+https://github.com/kylon/PQHex.git"
    'pqhex.ico'
    'pqhex.desktop'
)
sha256sums=(
    'SKIP'
    '8b3742983ea97064c8d635f7571cbd6a4be428b5ffb64a436b805d2d1efac52b'
    'aaea65499cd447e1324aebcbfac1123887a9d7d2e433942a23615cc694154daf'
)

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "v%s.%s" "${_version}" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B build -S pqhex -DCMAKE_BUILD_TYPE=Release

    cd build
    make
}

package() {
    install -Dm 755 ${srcdir}/build/PQHex -t "${pkgdir}"/usr/bin/
    install -Dm 644 ${srcdir}/pqhex.ico -t "${pkgdir}"/usr/icon/hicolor/
    install -Dm 644 pqhex.desktop -t "${pkgdir}"/usr/share/applications/
}
