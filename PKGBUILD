# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=asncounter
pkgver=0.2.0
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
sha512sums=('5f9a07f8b8ca8f12764cb23107553066cfa61cb3059f7b04ebf3ac84ce4519527300caffcb984793def29451cb5b3d33d334975decd33b5cdfc3b4ddaebb6aba')
b2sums=('8e611bfd849875b42aded9bd30b91204a70f8eb9b545a408047b4f4f477297be1192e12195a7d7337579e37aa0ebdb0ac1ea7473b82b33dc3b4ccdbb9a6b6460')

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
