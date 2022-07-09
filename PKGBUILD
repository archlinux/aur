# Contributor: bitwave <aur [at] oomlu [d0t] de>

pkgname=lemon-lang-git
pkgver=35.b1bb8a6
pkgrel=1
pkgdesc="An embeddable, lightweight programming language in ANSI C"
arch=(i686 x86_64)
url="https://github.com/lemon-lang/lemon"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
    cd lemon
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
    cd lemon
    # remove insecure rpath
    sed -i '/-rpath=\.\//d' Makefile
}

build() {
    make -C lemon STATIC=1
}

check() {
    make -C lemon STATIC=1 test
}

package() {
    cd lemon
    install -Dm755 lemon -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
