# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=dnsdiag
pkgver=2.7.0
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
sha256sums=('b573a549522cd1b9299542ef424ba7692309c9d4c28c17ca935f6651b3f960fc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
