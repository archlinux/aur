# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgname='quartet-git'
pkgver=r2.a99c049
pkgrel=1
pkgdesc="A tetrahedral mesh generator that does isosurface stuffing with an acute tetrahedral tile."
arch=('x86_64')
url="https://github.com/crawforddoran/quartet"
license=('ISC')
changelog="${pkgname}.changelog"
makedepends=('git' 'gcc')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("git+https://github.com/crawforddoran/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make depend
    make release
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -m 755 -DT "quartet_release" "${pkgdir}/usr/bin/quartet"
    install -m 755 -DT "view_tet_release" "${pkgdir}/usr/bin/view_tet"
}
