# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=5.4.2
pkgrel=0
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
sha1sums=('9d7d7bbeb6f9fb37200ce29865ed063e5b4df26f')
sha256sums=('b92c734e3f762fe4f0af4b4fe8e46c53fe4cce867387a9fa718119ac205a8650')

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
