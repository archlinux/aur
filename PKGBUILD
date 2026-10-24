# Maintainer: Michael Gates <michael at belowthesalt . us>
pkgname=pan-chainguard
_name=pan_chainguard
pkgver=0.15.0
pkgrel=1
pkgdesc="Manage Root Store and Intermediate Certificate Chains on PAN-OS"
arch=('any')
url="https://github.com/PaloAltoNetworks/${pkgname}"
license=('ISC')
depends=('python' 'python-pan-python' 'python-treelib' 'python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('openssl: used by the deprecated cert-fingerprints.sh')
source=("${_name}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('7db4763b204434140db92032fe1670a68db5fc7656dae00a340dd0f32cc14b7f')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
