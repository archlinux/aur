# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=grumpy-git
_pkgname=grumpy
pkgver=r123.08f9c2e
pkgrel=1
pkgdesc="Grumpy is a Python to Go source code transcompiler and runtime."
arch=('i686' 'x86_64')
url="https://github.com/google/grumpy"
license=('Apache')
provides=('grumpy')
conflicts=('grumpy')
depends=('go' 'python2')
makedepends=('git' 'go' 'python2')
source=("git+https://github.com/google/grumpy.git")
md5sums=('SKIP')
options=(!strip)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/grumpy"
}

build() {
    cd "$srcdir/grumpy"
    make PYTHON=python2
}

# check() {
#     cd "$srcdir/grumpy"
#     make PYTHON=python2 test
# }

package() {
    cd "$srcdir/grumpy/build"
    find . -name "*.d" -delete
    install -dm755 "$pkgdir/usr"
    install -dm755 "$pkgdir/usr/lib/go"
    cp -rv --no-preserve='ownership' bin lib "$pkgdir/usr/"
    cp -rv --no-preserve='ownership' pkg src "$pkgdir/usr/lib/go/"
}
