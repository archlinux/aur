# Maintainer: Ianis Vasilev <ianis@ivasilev.net>

pkgname=python-unicodeit
pkgbasename=${pkgname:7}
pkgver=0.7.5
pkgrel=1
pkgdesc="Converts LaTeX tags to unicode"
license=('MIT')
url='https://github.com/svenkreiss/unicodeit'
makedepends=(python python-build python-installer python-wheel)
depends=(python)
source=("https://pypi.io/packages/source/${pkgbasename:0:1}/${pkgbasename}/${pkgbasename}-${pkgver}.tar.gz")
sha256sums=('f100df7a1b8c64d7b5160859426b641cd9f30218173c5a3450842370e242a168')
arch=(any)

fullsrcdir() {
    echo "${srcdir}/${pkgbasename}-${pkgver}"
}

prepare() {
    cd $(fullsrcdir)
    echo '[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"' >> pyproject.toml
}

build() {
    cd $(fullsrcdir)
    python -m build --wheel --no-isolation
}

package() {
    cd $(fullsrcdir)
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
