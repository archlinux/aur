# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=asncounter
pkgver=0.5.0
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
sha512sums=('9b230dc5ff61094515629d73cf66dc196e666c1da1e6ee1f637c2b2cf1a8fc7ba2dfdce88a7f89d35c37dece7635448e6fe8f58d300d0daa1b750c3d35d49335')
b2sums=('201b4a99db9ccfd84a175d1ef068f4184a4bb376b3089e5730a0163d9799396b0c856ad3afeaf05f2dfc82a9fec2c8e47fead71d88e89850ce5b9f232dd7b6af')

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
