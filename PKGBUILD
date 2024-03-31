# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname=vidmerger
pkgname="${_pkgname}-git"
pkgver=r292.b02f60b
pkgrel=1
pkgdesc="Merge video and audio files via CLI."
arch=('x86_64')
url="https://github.com/tgotwig/vidmerger"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gcc-libs')
makedepends=("git" "rust")
provides=('vidmerger')
conflicts=('vidmerger')
source=("git+${url}.git"
        "https://raw.githubusercontent.com/tgotwig/vidmerger/cb3526790dae9ebc72f52c5c16d1428846645e53/LICENSE")
sha256sums=('SKIP'
            'fb25a5d14edb9164a63a126aec696eceb654b4b0e8b382bcac378b6c44eb920c')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}"

    install -Dm755 ${_pkgname}/target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
