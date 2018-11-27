# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=circus-python35
_pkgname=circus
pkgver=0.15.0
pkgrel=1
pkgdesc="A program that will let you run and watch multiple processes and sockets."
arch=('any')
url="http://circus.readthedocs.org"
license=('Apache')
depends=('python35' 'python-iowait' 'python-psutil' 'python-pyzmq' 'python-tornado')
makedepends=('python-distribute')
options=(!emptydirs)

source=("https://github.com/circus-tent/circus/archive/${pkgver}.tar.gz"
        "circus.ini" "circus.service")
md5sums=('3af18359f75317c4d70d941e26bb8352'
         '6ce050f557ad88cafcc476513e0578dc'
         '94dcc7c18eb935c62699135c5d048a1a')

conflicts=('circus')

build() {
  cd "$srcdir"/$_pkgname-$pkgver

  python3.5 setup.py build --executable="/usr/bin/python3.5"
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  python3.5 setup.py install --root="$pkgdir"/ --optimize=1 

  install -Dm 644 "$srcdir"/circus.ini "$pkgdir"/etc/circus/circus.ini
  install -Dm 644 "$srcdir"/circus.service "$pkgdir"/etc/systemd/system/circus.service
}
