# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-imgdiff
_pkgbasename=${pkgname:7}
pkgver=1.8.0
pkgrel=1
pkgdesc='Compare two images side-by-side'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=(MIT)
depends=(python python-pillow)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('ee8d6da71fe74ca27cc1086a133e91028a7dea7690c09d37077dcda0150f4677')
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
