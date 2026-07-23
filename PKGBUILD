# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=dnsdiag
pkgver=2.9.4
pkgrel=1
pkgdesc='DNS Measurement, Troubleshooting and Security Auditing Toolset'
arch=('any')
url='https://dnsdiag.org'
license=('BSD-2-Clause')
depends=(
  'python'
  'python-aioquic'
  'python-cryptography'
  'python-cymruwhois'
  'python-dnspython'
  'python-h2'
  'python-httpx'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/farrokhi/dnsdiag/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a1821bc6dadb2519c61532b322311b947f6ba10445a283f0caafe480a0e7876')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
