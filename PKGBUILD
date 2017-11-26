# Maintainer: Teteros <teteros at teknik dot io>

_pkgname=runt
pkgname=runt-git
pkgver=r194.02568f1
pkgrel=1
pkgdesc="Stack-based language written in ANSI C"
arch=('i686' 'x86_64')
url="http://paulbatchelor.github.io/proj/runt/"
license=('custom:public domain')
depends=('glibc')
makedepends=('git' 'sporth-git')
provides=('runt')
conflicts=('runt')
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Replace hardcoded /usr/local prefixes
    find "$_pkgname" -type f -exec sed -i "s|/usr/local|/usr|g" {} \;
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"

    install -Dm755 irunt "$pkgdir/usr/bin/irunt"
    install -Dm644 librunt.a "$pkgdir/usr/lib/librunt.a"
    install -Dm755 runt.h "$pkgdir/usr/include/runt.h"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -dm755 "$pkgdir/usr/share/doc"
    cp -a examples "$pkgdir/usr/share/doc/$pkgname"
}
