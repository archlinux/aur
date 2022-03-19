# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-pyxbe
pkgver=0.0.4
pkgrel=1
pkgdesc="Library to work with XBE files"
arch=('any')
url="https://github.com/mborgerson/pyxbe"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('daf95993d3acda7af08bf6d1dbb5a93c61751edaa2e79f57a43a17d269b59854')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
