# Maintainer: h5v <h5v@protonmail.com>

pkgname="mcabber-module-mucignore-git"
pkgrel=1
pkgver=1.dc5e4d7
pkgdesc="mcabber plugin to ignore messages from MUC user"
url="https://github.com/hirthwork/mcabber-mucignore"
arch=('any')
makedepends=()
source=(
    git+https://github.com/hirthwork/mcabber-mucignore
    makefile.patch
)
md5sums=(
    SKIP
    7219c0feeb45e15e3c7a07724b668f96
)

pkgver() {
    cd "mcabber-mucignore"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
    cd "mcabber-mucignore"
    git apply $srcdir/makefile.patch
}

build() {
    cd "mcabber-mucignore"
    make
}

package() {
    install -m 555 -D "$srcdir/mcabber-mucignore/libmucignore.so" "$pkgdir/usr/lib/mcabber/libmucignore.so"
}
