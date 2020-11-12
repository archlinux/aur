# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-tubes
pkgver=0.2.0
pkgrel=5
arch=(any)
pkgdesc='A data-processing and flow-control engine for event-driven programs'
url='https://github.com/twisted/Tubes'
license=(MIT)
depends=(python python-characteristic python-six python-twisted)
makedepends=(python-setuptools)
source=("https://github.com/twisted/tubes/archive/v$pkgver/tubes-v$pkgver.tar.gz")
sha512sums=('6039a3059b61f8a0c84d4e10bb47d9f2bb95505b0353cb0f1eefb6942f0ad0d88c9b02ff0d48ed0300d615d3e3203c5e884990cd6d006c2f1dbd18b88fcb2e9e')

build() {
  cd tubes-$pkgver
  python setup.py build
}

check() {
  cd tubes-$pkgver
  PYTHONPATH=. trial3 tubes
}

package() {
  cd tubes-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
