# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=servonaut
pkgver=2.35.0
pkgrel=1
pkgdesc="Manage AWS, Hetzner, OVH and custom servers from one TUI"
arch=('any')
url="https://github.com/zb-ss/servonaut"
license=('MIT')
depends=('python' 'python-bcrypt' 'python-boto3' 'python-cryptography' 'python-httpx' 'python-httpx-sse' 'python-keyring' 'python-pynacl' 'python-regex' 'python-tabulate' 'python-textual')
optdepends=(
  'python-numpy: voice input'
  'python-requests: headless account sign-in'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/s/servonaut/servonaut-${pkgver}.tar.gz")
sha256sums=('aab280a0b3d69311292fa1ceaee8624e9346612ec880fe7b1aaf3e025eab7aa5')

build() {
  cd "servonaut-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "servonaut-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
