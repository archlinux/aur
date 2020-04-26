# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-avocado
pkgver=78.0
pkgrel=1
pkgdesc="Set of tools and libraries to help with automated testing"
arch=('x86_64')
url="http://avocado-framework.github.io/"
license=('GPL2')
source=("https://github.com/avocado-framework/avocado/archive/${pkgver}.tar.gz")
sha256sums=('81e5aec7a588c5699f7012f82c7b12f8efa40eca8433db2f486f70136472adbe')
depends=('python' 'libvirt-python')
makedepends=('python-setuptools')

build() {
  cd "avocado-${pkgver}"
  python setup.py build
  make man
}

false &&
check() {
  cd "avocado-${pkgver}"
  make check-full
}

package() {
  cd "avocado-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 man/*.1 "$pkgdir/usr/share/man/man1/"
}
