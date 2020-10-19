# Maintainer: Nathan Monfils <nathanmonfils@gmail.com>

pkgname=python-jsonschema-typed-git
pkgver=r42.54d2f8c
pkgrel=2
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
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
