# Maintainer: Hao Long <aur@esd.cc>

pkgname=wafw00f
pkgver=2.4.2
pkgrel=2
pkgdesc="The Web Application Firewall Fingerprinting Tool"
arch=("any")
url="https://github.com/EnableSecurity/wafw00f"
license=('BSD-3-Clause')
depends=('python' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('cbcb271b7389190c5fac1b91b740872dc2a7549fafab33505ade13addea357830de9b0080a7294aae4882092fa9b6946d9b84ffa145ca87a50db2a47d1375110')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
