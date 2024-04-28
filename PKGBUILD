# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='pyocclient'
pkgname='python-pyocclient'
pkgver='0.6'
pkgrel='3'
pkgdesc='Python client library for ownCloud'
arch=('x86_64' 'aarch64')
url="https://github.com/owncloud/${pkgbase}"
depends=('python-requests' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ec524bbabecd2ba00315f6517dc0628bb2c8c32d644a3c5dfc2f1e7d61eb65b4')

build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgbase}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/"*".whl"
  install -Dm0644 "LICENSE.txt" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
