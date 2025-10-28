# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=python-pyrdfa3
_name=pyrdfa3
pkgver=3.6.5
pkgrel=1
pkgdesc="Python distiller/parser library"
arch=('any')
url="https://github.com/prrvchr/pyrdfa3"
license=('custom')
depends=(python python-rdflib python-html5lib python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://github.com/prrvchr/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz"
        "$pkgname.license::https://github.com/prrvchr/$_name/raw/master/LICENSE")
sha256sums=('8d336179b30b3ee6d0ffb683d65aedd266191ad6bbcdb3e209ea6a9f6df680e2'
            '18e8c2a924d44bdfdce3055db70bd4de7fad7f1d60df29458755a64bcb04766f')

build() {
    cd "$_name-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 "$pkgname.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$_name-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
