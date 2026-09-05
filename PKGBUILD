# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=6.0.3
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
sha1sums=('172527654913de251cdb50e49d840bfa88ae811e')
sha256sums=('42df9779e4eb875353a7de1ca41a7c83c4faf7add768c6eca32fc499e0497548')

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
