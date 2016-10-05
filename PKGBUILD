# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=circus
pkgver=0.14.0
pkgrel=1
pkgdesc="A program that will let you run and watch multiple processes and sockets."
arch=('any')
url="http://circus.readthedocs.org"
license=('Apache')
depends=('python-iowait' 'python-psutil' 'python-pyzmq' 'python-tornado')
makedepends=('python-distribute')
options=(!emptydirs)

source=("https://github.com/circus-tent/circus/archive/${pkgver}.tar.gz"
        "circus.ini" "circus.service")
md5sums=('066fd34445a743f5404a5873f1ca3f84'
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
