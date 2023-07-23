# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=fireplace-git
pkgver=r56.aa2070b
pkgrel=1
pkgdesc='A cozy fireplace in your terminal'
arch=('x86_64')
url='https://github.com/Wyatt915/fireplace'
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/Wyatt915/${pkgname%-*}.git")
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build()
{
    cd "$pkgname"
    make DESTDIR="$pkgdir"
}

package()
{
    cd "$pkgname"

    install -vDm755 -t "$pkgdir/usr/bin" fireplace
}
