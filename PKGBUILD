# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=6.0.2
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
sha1sums=('847d58544f21c93c76373db9c337573253c85d2e')
sha256sums=('b0ea035ee3e14a8331f00a90d8e9bd78658b5bf13094a7c61f3455a836b730ba')

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
