# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=6.1.1
pkgrel=1
pkgdesc='A simple CLI for Vikunja'
arch=('any')
url='https://gitlab.com/ce72/vja'
license=('GPL-3.0-or-later')
depends=('python'
         'python-click'
         'python-click-aliases'
         'python-dateutil'
         'python-parsedatetime'
         'python-pyjwt'
         'python-requests'
        )
makedepends=('python-build'
             'python-setuptools'
             'python-wheel'
             'python-installer'
            )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('aea8cef40360d619b98e0db7a507d8405dfdaf31')
sha256sums=('7a6d80cfa97ea848578faeeb064e6e769e53b03821f1d03f1e0d62598aa0c912')

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
