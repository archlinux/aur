# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Kyle Laker <kyle+aur@laker.email>
pkgname=python-readchar
pkgver=3.0.3
pkgrel=1
pkgdesc="Python library to read characters and key strokes"
arch=("any")
url="https://github.com/magmax/python-readchar"
license=("MIT")
depends=("python")
makedepends=("python-setuptools" "flake8")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-readchar/archive/v$pkgver.tar.gz"
        "LICENSE")
md5sums=('f7ee27cbdea3de2477e8a1bc20678a09'
         '6fe7ddd14c619721d6db734a05d7d423')

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
