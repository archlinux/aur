# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-tubes
pkgver=0.2.1
pkgrel=4
arch=(any)
pkgdesc='A data-processing and flow-control engine for event-driven programs'
url='https://github.com/twisted/Tubes'
license=(MIT)
depends=(python python-characteristic python-six python-twisted)
makedepends=(python-setuptools)
source=("https://github.com/twisted/tubes/archive/v$pkgver/tubes-v$pkgver.tar.gz")
sha512sums=('6f4666f1591c96d0d7f0514f511ad700f6c3976fcf561f0d967f26aead089e682540b74f85b26a68ff6877d5d7775654c9f6959d8a41c25804375ca837ac1815')

build() {
  cd tubes-$pkgver
  python setup.py build
}

check() {
  cd tubes-$pkgver
  PYTHONPATH=. trial tubes
}

package() {
  cd tubes-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
