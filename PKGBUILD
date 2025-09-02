# Maintainer: <dns_issue@tutamail.com>
pkgname=python-cdp-socket
_pypiname=cdp-socket
pkgver=1.2.8
pkgrel=1
pkgdesc="Socket for handling Chrome DevTools Protocol connections (Python)"
arch=('any')
url="https://pypi.org/project/${_pypiname}/"
license=('MIT')
depends=('python')  
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${_pypiname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname:0:1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('d8a3d55883205c7c45c05292cf5ef5a5c74534873e369e258e61213cce15be1a')

build() {
  cd "${_pypiname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pypiname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
}
