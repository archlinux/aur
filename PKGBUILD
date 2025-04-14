# Maintainer: userbyte <contact@userbyte.xyz>
_pkgname=ipinfo
pkgname=python-ipinfo
pkgver=5.1.1
pkgrel=1
pkgdesc="Official Python library for IPInfo"
url="https://github.com/ipinfo/python"
depends=('python' 'python-requests' 'python-cachetools' 'python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

sha256sums=('be5a33adac9681bc68280eb5aae16a83e4abbb5f192c87dcc5ee18bdd0ceb276')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    chmod -R 655 ${pkgdir}/usr/lib/python*/site-packages/$_pkgname*
}
