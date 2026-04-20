# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Andriessens <kevin@kelaun.be>

pkgname=python-aiohttp-rpc
_name="${pkgname#python-}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Library for integrating JSON-RPC 2.0 protocol with python-aiohttp"
arch=('any')
url="https://github.com/expert-m/aiohttp-rpc"
license=('MIT')
depends=('python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name/-/_}/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('80117b632383e0308e537c2c1b78c427fcd7f865be9cc06fc418a6c37c02989f')

build() {
    cd "${_name/-/_}-$pkgver"
    python -m build -wn
}

package() {
    cd "${_name/-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/${_name/-/_}-$pkgver.dist-info/licenses/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}
