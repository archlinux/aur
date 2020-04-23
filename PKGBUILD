# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=day-image-git
pkgver=r12.gcca7ae6
pkgrel=1
pkgdesc="Sets the image of the day of different sources as a wallpaper on Linux"
arch=('x86_64')
url="https://github.com/Golim/day-image"
license=('MIT')
depends=('curl' 'feh')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    make
}

package() {
    cd "${pkgname%-*}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
