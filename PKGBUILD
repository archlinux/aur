# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Kyle Laker <kyle+aur@laker.email>
pkgname=python-readchar
pkgver=3.0.5
pkgrel=1
pkgdesc="Python library to read characters and key strokes"
arch=("any")
url="https://github.com/magmax/python-readchar"
license=("MIT")
depends=("python")
makedepends=("python-setuptools" "flake8")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-readchar/archive/v$pkgver.tar.gz"
        "LICENSE")
md5sums=('827709aca051803b086f2b5d966fe61d'
         '688183518094c78c59f08f1b74493a98')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"

    # Fix the tests getting included in the package
    sed -i' ' -e's/"tests"/"tests*"/' setup.py
}

build() {
    cd "${srcdir}/$pkgname-$pkgver"

    python setup.py build
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
