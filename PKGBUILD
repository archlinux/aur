# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname=wackywebm-git
pkgver=r282.768e19c
pkgrel=1
pkgdesc=" This is a simple tool to allow you to create WebM files with changing aspect ratios. "
arch=('any')
url="https://github.com/OIRNOIR/WackyWebM"
license=('GPL3')
depends=('nodejs' 'ffmpeg')
makedepends=('npm')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/OIRNOIR/WackyWebM.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname%-git}"
    npm install -g --prefix "${pkgdir}/usr"
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
