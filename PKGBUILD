# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-pytest-image-diff
_pkgbasename=${pkgname:7}
pkgver=0.0.11
pkgrel=1
pkgdesc='pytest helps for compare images and regression'
arch=(any)
url="https://pypi.org/project/${_pkgbasename}/"
license=('MIT')
depends=(python python-diffimg python-imgdiff)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.io/packages/source/${_pkgbasename:0:1}/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('50443ee1ad3cb5fa2d0b6cfc2d21a70eff8666a4d447e1f55e3e73f7b94413d9')
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
