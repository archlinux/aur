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
    '657c802cfd37460d06d908eadbd05723e64bfa4cd76368c7d2202b90f25a7368'
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
