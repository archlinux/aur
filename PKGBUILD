# Maintainer: Michael Gates <michael at belowthesalt . us>
pkgname=pan-chainguard
_name=pan_chainguard
pkgver=0.16.0
pkgrel=1
pkgdesc="Manage Root Store and Intermediate Certificate Chains on PAN-OS"
arch=('any')
url="https://github.com/PaloAltoNetworks/${pkgname}"
license=('ISC')
depends=('python' 'python-pan-python' 'python-treelib' 'python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('openssl: used by the deprecated cert-fingerprints.sh')
source=("${_name}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('e099832e939723b4642b76c79891456bced29230ababb5f3c189f2e7b49ac604')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
