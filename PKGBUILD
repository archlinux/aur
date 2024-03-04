# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-wstools
pkgver=0.4.10
pkgrel=6
pkgdesc="WSDL parsing services package for Web Services for Python"
arch=('any')
url="https://github.com/pycontribs/wstools"
license=('custom')
depends=('python-six')
makedepends=('python-pbr' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-runner' 'autopep8' 'python-pytest-cov')
source=("https://github.com/pycontribs/wstools/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        python310.patch)
sha512sums=('1acd8e62d71c7d330f1e953a0da1956291c5dfb25ff9b8b8799c83feaa4230e384955735b131bab7b430b92ae6c18498927d416d2d1e11fb5c5dad93417c671a'
            'd1eb690578eaf7f5e79d9dbc0494b545d88e124e11f9927c5c17c9e64b7cba209fbe5ad68b43afd84c850d22c36133e39e305d214ea55e8a7935e06a465f8947')

export PBR_VERSION=$pkgver

prepare() {
  cd wstools-$pkgver
  patch -Np1 -i ../python310.patch
}

build() {
  cd wstools-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd wstools-$pkgver
  pytest
}

package() {
  cd wstools-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 docs/* "$pkgdir/usr/share/licenses/$pkgname"/
}
