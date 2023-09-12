# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname=vidmerger
pkgname="${_pkgname}-git"
pkgver=r247.78e3d0c
pkgrel=1
pkgdesc="Merge video and audio files via CLI."
arch=('x86_64')
url="https://github.com/tgotwig/vidmerger"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gcc-libs')
makedepends=("git" "rust")
provides=('vidmerger-bin')
conflicts=('vidmerger-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
