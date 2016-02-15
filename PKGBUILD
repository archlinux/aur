# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=circus
pkgver=0.13.0
pkgrel=2
pkgdesc="A program that will let you run and watch multiple processes and sockets."
arch=('any')
url="http://circus.readthedocs.org"
license=('Apache')
depends=('python-iowait' 'python-psutil' 'python-pyzmq' 'python-tornado')
makedepends=('python-distribute')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/c/circus/circus-${pkgver}.tar.gz"
        "circus.ini" "circus.service")
md5sums=('cddd4a8844907d8b6b402ca9c713d176'
         '6ce050f557ad88cafcc476513e0578dc'
         '94dcc7c18eb935c62699135c5d048a1a')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -Dm 644 "$srcdir"/circus.ini "$pkgdir"/etc/circus/circus.ini
  install -Dm 644 "$srcdir"/circus.service "$pkgdir"/etc/systemd/system/circus.service
}
