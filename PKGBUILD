# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=4.7.2
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
sha1sums=('bdaf8ec398825653f5a35ea13c85c122c37b4b9a')
sha256sums=('81a418fe2e0521e86c6d1c9ab9a72cf0721fe032a26ee3c9ec6a16f2cdfc79af')

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
