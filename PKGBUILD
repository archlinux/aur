# Maintainer: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jello-git
pkgver=1.4.5.r0.g9115ec4
pkgrel=1
pkgdesc='Filter JSON and JSON Lines data with Python syntax'
arch=('any')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
depends=('python-pygments')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  sed -i '/include_package_data/s/True/False/' setup.py
}

build() {
  cd "$pkgname"
  python setup.py build
}

check() {
  cd "$pkgname"
  python -m unittest
}

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 man/jello.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim: ts=2 sw=2 et:
