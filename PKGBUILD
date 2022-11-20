# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-service-identity
pkgver=21.1.0
pkgrel=4
pkgdesc="Service identity verification for pyOpenSSL"
arch=('any')
license=('MIT')
url="https://pypi.python38.org/pypi/service_identity"
depends=('python38-attrs' 'python38-pyasn1-modules' 'python38-pyasn1' 'python38-cryptography' 'python38-six')
makedepends=('python38-setuptools' 'python38-idna')
checkdepends=('python38-pytest-runner')
optdepends=('python38-idna: for Internationalized Domain Names support')
replaces=('python38-service_identity')
source=("https://github.com/pyca/service-identity/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6375bc5e8329118b2beb163ffffecc1479839e4e98173576e4737deebcc4c057ac357315976d3f53a280defd4e2c1f6b74e9604ec1aa94144240c2fb4bf07461')

build() {
  cd service-identity-$pkgver
  python3.8 setup.py build
}

check() {
  cd service-identity-$pkgver
  python3.8 setup.py pytest
}
 
package() {
  cd service-identity-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
