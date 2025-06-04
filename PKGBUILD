# Maintainer: Norbert <norbert@archworks.co>
pkgname=python-drools-jpy
_pkgname=drools_jpy
pkgver=0.3.10
pkgrel=1
pkgdesc="Python package to directly call Drools Java classes using JPY"
arch=('any')
url="https://github.com/ansible/drools_jpy"
license=('Apache')
depends=('jdk-openjdk' 'python-jpy' 'maven')
makedepends=('python-build' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ansible/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42747f0c9777a8334a75cc6659eb37f978ca72a003db2a0bb5091c675bfeb362')

build() {
  cd "${srcdir}/drools_jpy-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/drools_jpy-${pkgver}"
  python -m pip install --root="$pkgdir" --no-deps --no-build-isolation dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
