# Maintainer: Nathan Monfils <nathanmonfils@gmail.com>

pkgname=python-jsonschema-typed-git
pkgver=r42.54d2f8c
pkgrel=1
pkgdesc="Use JSON Schema for type checking in Python"
arch=(any)
url="https://github.com/inspera/jsonschema-typed"
license=('MIT')
depends=(python python-jsonschema mypy)
makedepends=(python git python-setuptools)
provides=("${pkgname}")
conflicts=("python-jsonschema-typed")
source=("${pkgname}::git+https://github.com/inspera/jsonschema-typed")
md5sums=('SKIP')

build() {
    rm -rf "$srcdir/$pkgname-build"
    git clone "$srcdir/$pkgname" "$srcdir/$pkgname-build"
    cd "$srcdir/$pkgname-build"

    python setup.py build
}

package() {
    rm -rf "$pkgdir/usr/lib/python3.8/site-packages"
    mkdir -p "$pkgdir/usr/lib/python3.8/site-packages"
    cp -r "$srcdir/$pkgname-build/build/lib/jsonschema_typed" "$pkgdir/usr/lib/python3.8/site-packages/jsonschema_typed"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
