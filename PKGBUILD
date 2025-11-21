# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=4.10.1
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
makedepends=('python-build'
             'python-setuptools'
             'python-wheel'
             'python-installer'
            )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('c6b7ac7818b8a3b5c2a82b69a86367d4711a9ce8')
sha256sums=('4d24feaf91868729714d8703fa60d8971f3d72ec36e609f86607edee0b0556ec')

prepare() {
  cd "$pkgname-$pkgver"
  rm -r tests/
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 noet:
