# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=gpgsync
pkgver=0.3.6
pkgrel=2
pkgdesc="Designed to let users always have up-to-date public keys for other members of their organization"
arch=('any')
url="https://github.com/firstlookmedia/gpgsync"
license=('GPL3')
depends=('gnupg' 'python-dateutil' 'python-packaging' 'python-pyqt5' 'python-pysocks' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname".{service,timer})
sha256sums=('f630127830bdf532ef324c18bf55c932d072ccf4e98a1730b33499891d87a604'
            '659666bfa21f02c2dce5dd03b31ca50a2d501232a487af531bb739c0e7b356ad'
            'ae7fbc654db000ddcbc1c24be946865a830026e418031b600e16f293c230087c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/$pkgname".{service,timer} -t "$pkgdir/usr/lib/systemd/user/"
}


# vim:set ts=2 sw=2 et
