# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-types-fpdf2
_pkgbasename=${pkgname:7}
pkgver=2.8.4.20260221
pkgrel=1.314
pkgdesc='Typing stubs for fpdf2'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=('Apache-2.0')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('4350911f72fad000e351eb8b0ad8d7c7f8f8476b273100f33eeb41fbab737028')
arch=(any)

_fullsrcdir() {
    echo "${srcdir}/${_pkgbasename//-/_}-${pkgver}"
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
