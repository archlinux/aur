# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=woff2-git
pkgver=r99.2855ee7
pkgrel=1
pkgdesc="Font compression reference code"
arch=('i686' 'x86_64')
url="https://github.com/google/woff2"
license=('Apache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/google/woff2.git")
md5sums=('SKIP')

pkgver()
{
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/${pkgname%-git}"
    git submodule init
    git submodule update
    make clean all
}

package()
{
    cd "$srcdir/${pkgname%-git}"
    for bin in woff2_compress woff2_decompress
    do
        install -m 755 -D "$bin" "${pkgdir}/usr/bin/$bin"
    done
}
