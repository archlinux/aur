# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=circus
pkgver=0.13.0
pkgrel=1
pkgdesc="A program that will let you run and watch multiple processes and sockets."
arch=('any')
url="http://circus.readthedocs.org"
license=('Apache')
depends=('python-iowait' 'python-psutil' 'python-pyzmq' 'python-tornado')
makedepends=('python-distribute')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/c/circus/circus-${pkgver}.tar.gz"
        "circus.service")
md5sums=('cddd4a8844907d8b6b402ca9c713d176'
         '94dcc7c18eb935c62699135c5d048a1a')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D "$srcdir"/circus.service "$pkgdir"/etc/systemd/system/circus.service
}
