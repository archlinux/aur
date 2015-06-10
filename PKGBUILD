# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=cheat
pkgname=${_pkgname}-bash-git
pkgver=20140917.r29.19f26b8
pkgrel=1
pkgdesc="A Bash reimplementation of a command line tool to create and view interactive cheatsheets"
url="https://github.com/jahendrie/${_pkgname}"
license=('GPL3')
arch=('any')
depends=('bash')
makedepends=('git')
source=("git://github.com/jahendrie/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname
    install -Dm755 src/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 doc/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
    install -d "${pkgdir}//usr/share/${_pkgname}"
    cp -R data/* "${pkgdir}/usr/share/${_pkgname}/"
}
