# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=3.4.0
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
sha1sums=('ed9a08c8a49de5696c31dba99a8cff59ec6eae12')
sha256sums=('61bd2f0e461fa80b2349d99962ce3fc87bb17a0d0ccd5f35621724f994c4ecf6')

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
