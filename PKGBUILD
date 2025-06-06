# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=asncounter
pkgver=0.3.0
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
sha512sums=('2bbcff4d0934dffc498d88a33c7470a667e054e00acafe636e77d4e0a66ac23b7383f2b10f461f2243bf1a0d3711857aa5aa7032de3b0d0e35e1bae5631e3080')
b2sums=('34c4408950f6043d70d27c33603fd6c40b1fd889448fc95f15f706936fcb500ba0359e37d2137744301fa69c33abe12668698ba8a11684f0af6bbb3ea2bd75d3')

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
