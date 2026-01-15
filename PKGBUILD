# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-types-fpdf2
_pkgbasename=${pkgname:7}
pkgver=2.8.4.20251031
pkgrel=1.314
pkgdesc='Typing stubs for fpdf2'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=('Apache-2.0')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('8cd23d1c31dad586fbdad67fbdb5eb7e9c8e437f836d7766bf9b4ce375c609a4')
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
