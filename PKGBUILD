# Maintainer: Gauthier B <gogoprog at gmail dot com>
pkgname=ddsviewer-git
pkgver=r19.b3eba50
pkgrel=1
epoch=1
pkgdesc='DDS file viewer (DirectDraw Surface)'
arch=(i686 x86_64)
url=https://github.com/gogoprog/ddsviewer
license=(GPL2)
depends=(sfml)
makedepends=(git premake)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}/build"
    premake5 gmake
    make config=release
}

package() {
    install -Dm755 "${pkgname%-git}/build/bin/Release/${pkgname%-git}" -t ${pkgdir}/usr/bin
}
