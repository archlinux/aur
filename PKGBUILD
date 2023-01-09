# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=docker-abuild-git
_pkgname=docker-abuild
pkgver=r139.d5b2431
pkgrel=1
pkgdesc="Dockerised abuild"
arch=(any)
url="https://gitlab.alpinelinux.org/alpine/docker-abuild"
license=(MIT)
provides=(docker-abuild)
conflicts=(docker-abuild)
depends=(bash)
makedepends=(git)
source=("git+https://gitlab.alpinelinux.org/alpine/docker-abuild.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 dabuild \
        "$pkgdir"/usr/bin/dabuild
    install -Dm644 LICENSE.md \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
