# Maintainer: Jon Nordby <jononor@gmail.com>
pkgname=uf2-utils-git
pkgver=r8.3ca6d14
pkgrel=2
pkgdesc="Toolbox for working with UF2 format. bin2uf2/uf22bin/uf2dump"
arch=('x86_64')
url="https://github.com/tinyvision-ai-inc/uf2-utils"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/tinyvision-ai-inc/uf2-utils.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
    make PREFIX="$pkgdir/usr" install
}
