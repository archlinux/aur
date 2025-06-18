# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=asncounter
pkgver=0.4.0
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
sha512sums=('00ff64c20dd060bc2d86aa52d1ffdd87a3d936d26f062a493f251385199cd9d2d7a32da60f7290abfbc1332a6a56473757c66abaad4a93716b9168c4dd881d2d')
b2sums=('f9da66855b86af6f19d8c39991b79fe60133f8d14c30fc5d83a1bc7b8f7f6107a56f35b5981708f64f13cd5b68b956522b93eec9e2e68615d9a65d730d4dc464')

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
