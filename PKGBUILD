# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=gsu-git
_pkgname=gsu
pkgver=20170913.9016a15
pkgrel=1
pkgdesc="A general screenshot and upload utility for images, video, and gifs."
arch=("any")
url="https://github.com/winneon/${_pkgname}"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("maim" "ffmpeg" "curl" "jq" "bash")
optdepends=(
    "xclip: Copy URLs to clipboard after upload."
    "dmenu: Display a menu to select the output type from."
    "rofi: Display a menu to select the output type from."
    "libnotify: Display a notification when the utlity is finished."
)
makedepends=("git")
source=("${pkgname}::git+https://github.com/winneon/gsu.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git log -1 --format="%cd.%h" --date=short | tr -d -
}

package() {
    cd "${pkgname}"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    make DESTDIR="${pkgdir}" install
}
