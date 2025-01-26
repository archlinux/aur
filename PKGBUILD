# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-pytest-image-diff
_pkgbasename=${pkgname:7}
pkgver=0.0.14
pkgrel=1
pkgdesc='pytest helps for compare images and regression'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=(MIT)
depends=(python python-diffimg python-imgdiff)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('2405dba60c8009c93a7cafc15976cc8f2b1b8f33ffe8126e35d72a6d22e19850')
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
