# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-unicodeit
_pkgbasename=${pkgname:7}
pkgver=0.7.5
pkgrel=3
pkgdesc="Converts LaTeX tags to unicode"
license=('MIT')
url='https://github.com/svenkreiss/unicodeit'
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('f100df7a1b8c64d7b5160859426b641cd9f30218173c5a3450842370e242a168')
arch=(any)

_fullsrcdir() {
    echo "${srcdir}/${_pkgbasename}-${pkgver}"
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
