# Maintainer: Max <max@swk-web.com>

_pkgname=csv-diff
pkgname=python-${_pkgname}
pkgver=1.1
pkgrel=2
pkgdesc='Tool for viewing the difference between two CSV, TSV or JSON files.'
arch=('any')
url=''https://pypi.org/project/csv-diff/
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-pip' 'python-dictdiffer' 'python-click')
source=("$pkgname-$pkgver.tar.gz::https://github.com/simonw/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "setup-exclude-tests.patch")
sha256sums=('588a9b3203564e875030f7ef47b96ccb4ee134d70a09c0175c0881580a00a7bf'
            '2431612ac5a873dfb832181b41a7652fd01857ba6c788dae6e3187178492c7ae')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -N < "$srcdir"/setup-exclude-tests.patch
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

