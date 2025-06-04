# Maintainer: Norbert <norbert@archworks.co>
pkgname=ansible-rulebook
_pkgname=ansible_rulebook
pkgver=1.1.6
pkgrel=2
pkgdesc="Event-driven automation CLI for Ansible"
arch=('any')
url="https://github.com/ansible/ansible-rulebook"
license=('Apache')
depends=(
  'ansible-core'
  'ansible-runner'
  'jdk-openjdk'
  'python-aiohttp'
  'python-dpath'
  'python-drools-jpy'
  'python-janus'
  'python-jpy'
  'python-psycopg'
  'python-requests'
  'python-watchdog'
  'python-websockets'
  'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/ansible/ansible-rulebook/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b2a27fccdb70a3b1faaeae45cef5c37fb1e2613649f0d1679ac1ba3dfc2657d3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
