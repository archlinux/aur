# Maintainer: Andreas Grigorjew <aur at andreasgrigorjew dot de>

pkgname=checktestdata-git
pkgrel=1
pkgver=r293.g5f981cd
pkgdesc="DOMJudge checktestdata tool"
arch=('x86_64')
url="https://github.com/DOMjudge/checktestdata"
license=('BSD-2-Clause')
depends=('boost' 'gmp')
makedepends=('git' 'gcc' 'flexc++' 'bisonc++' 'automake')

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    ./bootstrap
    make dist
    make
}

check() {
    cd "$pkgname"
    make check
}

package() {
    cd "$pkgname"
    install -Dm755 checktestdata \
    "$pkgdir/usr/bin/checktestdata"

    install -Dm644 COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
