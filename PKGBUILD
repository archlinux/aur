# Maintainer: Lars Niesen <lars.niesen@mailbox.org>
# Contributor: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Contributor: Kyle Laker <kyle+aur@laker.email>
pkgname=python-readchar
pkgver=4.2.1
pkgrel=1
pkgdesc="Python library to read characters and key strokes"
arch=("any")
url="https://github.com/magmax/python-readchar"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-readchar/archive/v$pkgver.tar.gz"
        "LICENSE")
md5sums=('2f71e2849677816981ae6e0b4ec1019f'
         '688183518094c78c59f08f1b74493a98')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"

}

build() {
    cd "${srcdir}/$pkgname-$pkgver"

    GITHUB_REF="refs/tags/$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
