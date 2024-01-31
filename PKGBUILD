# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-msgraph-core
pkgver=1.0.0
pkgrel=1
pkgdesc='Core component of the Microsoft Graph Python SDK consisting of HTTP/Graph Client and a configurable middleware pipeline (Preview).'
arch=(any)
url=https://github.com/microsoftgraph/msgraph-sdk-python-core
license=(MIT)
depends=('python-microsoft-kiota-abstractions' 'python-microsoft-kiota-authentication-azure' 'python-microsoft-kiota-http' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/m/msgraph-core/msgraph-core-${pkgver}.tar.gz")
sha512sums=('c999e547cb4caa00fda136e0c0c0cae1e20001edc23c489c2695237d6b71756585bdc513a43c816a2833cab6e718bf08918dea334d03408ccc272ba027fcfcf7')

build() {
  cd msgraph-core-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd msgraph-core-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
