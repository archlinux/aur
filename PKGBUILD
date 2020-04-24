# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=day-image-git
pkgver=r14.gd9abfe3
pkgrel=1
pkgdesc="Sets as wallpaper the picture of the day of different sources"
arch=('x86_64')
url="https://github.com/Golim/day-image"
license=('MIT')
depends=('feh')
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
