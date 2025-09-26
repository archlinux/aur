# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=4.8.0
pkgrel=1
pkgdesc='A simple CLI for Vikunja'
arch=('any')
url='https://gitlab.com/ce72/vja'
license=('GPL-3.0-or-later')
depends=('python'
         'python-click'
         'python-click-aliases'
         'python-requests'
         'python-parsedatetime'
         'python-dateutil'
        )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('bc0290f2f3de690080386ac3eba5081ea789b947')
sha256sums=('3c0d13b9705c9bbf0c4bd5403f21d6c3c53b0c2e413a1b8d771ea2bc3760212d')

prepare() {
  cd "$pkgname-$pkgver"
  rm -r tests/
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
