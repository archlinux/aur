
pkgname=python2-service-identity
pkgver=21.1.0
pkgrel=1
pkgdesc="Service identity verification for pyOpenSSL"
arch=('any')
license=('MIT')
url="https://github.com/pyca/service-identity"
depends=('python2-attrs' 'python2-pyasn1-modules' 'python2-pyasn1' 'python2-cryptography' 'python2-six')
makedepends=('python2-setuptools' 'python2-idna')
checkdepends=('python2-pytest-runner')
optdepends=('python2-idna: for Internationalized Domain Names support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyca/service-identity/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6375bc5e8329118b2beb163ffffecc1479839e4e98173576e4737deebcc4c057ac357315976d3f53a280defd4e2c1f6b74e9604ec1aa94144240c2fb4bf07461')

build() {
  cd service-identity-$pkgver
  python2 setup.py build
}

check() {
  cd service-identity-$pkgver
  python2 setup.py pytest
}

package() {
  cd service-identity-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
