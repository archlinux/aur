# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=asncounter
pkgver=0.7.0
pkgrel=1
pkgdesc='Count the number of hits (HTTP, packets, etc) per autonomous system number (ASN) and related network blocks.'
url='https://gitlab.com/anarcat/asncounter'
license=('GPL-3.0-or-later')
arch=('any')
depends=(
  python
  python-pyasn
)
makedepends=(
  python-build python-installer python-wheel
  python-setuptools-scm
)
optdepends=(
  'python-manhole: for a REPL socket'
  'python-netaddr: for aggregating results'
  'python-scapy: for collecting from scapy'
  'python-prometheus_client: for output data in prometheus format'
)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/anarcat/asncounter/-/archive/$pkgver/asncounter-$pkgver.tar.gz")
sha512sums=('402ebfe9579b2b625507fb0ebe6a2a6b90d31109e236eaee6e8fe66141df8381cdbe32e6056091a372e6fc0d6cc34d623740e8b6f2b7bc9b5dda301a7b81517a')
b2sums=('2e409fb0a23a95410e866ffa3c0b1592c45dcda438772d7ff6e46f75faf496310e8ebf96ff920a9605887a79f38d6c7270d62c76a13029e45797c6d9c96f23d3')

build() {
  cd "asncounter-$pkgver"

  export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_ASNCOUNTER="$pkgver-$pkgrel"

  python -m build --wheel --no-isolation
}

package() {
  cd "asncounter-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
