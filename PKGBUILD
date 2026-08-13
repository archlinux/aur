# Maintainer: tyr4nux

pkgname=python-pywhisker
pkgver=1.0.0
pkgrel=1
pkgdesc='Python version of the C# tool for "Shadow Credentials" attacks'
arch=('any')
url="https://github.com/ShutdownRepo/pywhisker"
license=('GPL-3.0-only')

depends=(
  'impacket'
  'python'
  'python-cryptography'
  'python-dsinternals'
  'python-ldap3'
  'python-ldapdomaindump'
  'python-pyasn1'
  'python-rich'
  'python-six'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=("https://github.com/ShutdownRepo/pywhisker/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("b73cb29a13a904fcdebe8184491f2cdfaae111b87471407b420b6a5d4aa1a243")

build() {
  cd pywhisker-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd pywhisker-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
