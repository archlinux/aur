# Maintainer: Lars Niesen <lars.niesen@mailbox.org>
# Contributor: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Contributor: Kyle Laker <kyle+aur@laker.email>
pkgname=python-readchar
pkgver=4.2.2
pkgrel=1
pkgdesc="Python library to read characters and key strokes"
arch=("any")
url="https://github.com/magmax/python-readchar"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-readchar/archive/v$pkgver.tar.gz"
        "LICENSE")

sha256sums=('fe6e320636b185a67eb412d7ad8eb2946a4381be3c07eb92193cecd728c12bff'
            'bd18ea723a557aba802aeb85284cae6e951873e2a16bb61050af437ae6dafcfe')

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
