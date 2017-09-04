# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu-git
_pkgname=gsu
pkgver=1.0.0.r5.gc5caaa5
pkgrel=1
pkgdesc="A general screenshot and upload utility for images, video, and gifs."
arch=("any")
url="https://github.com/winneon/${_pkgname}"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("maim" "ffmpeg" "curl" "jq" "bash")
optdepends=(
    "xclip: Copy URLs to clipboard after upload"
)
makedepends=("git")
source=("${pkgname}::git+https://github.com/winneon/gsu.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

package() {
    cd "${pkgname}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
