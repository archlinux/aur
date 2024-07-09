# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=4.1.0
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
sha1sums=('97a9e61d73923350be4b63791a104ad5c80b72d6')
sha256sums=('4db91ff8667109ddbc7cbf079793f681b825c097144a22499c6e4063e4881494')

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
