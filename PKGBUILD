# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello
pkgver=1.4.5
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('any')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
makedepends=('python-setuptools')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b15a3c8b55b0149dddaf01fc989bc7b6b418e87967a8368f6dec2c4b5fb00132')

prepare() {
  cd "$pkgname-$pkgver"
  ## setup.py installs man page to site-package directory; we don't want that
  sed -i '/include_package_data/s/True/False/' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python -m unittest
}

package() {
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 man/jello.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
