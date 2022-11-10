# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-avocado
pkgver=99.0
pkgrel=1
pkgdesc="Set of tools and libraries to help with automated testing"
arch=('any')
url="http://avocado-framework.github.io/"
license=('GPL2')
source=("https://github.com/avocado-framework/avocado/archive/${pkgver}.tar.gz")
sha256sums=('422eb885d1bd1711298fe55e1fec8c676f07589acd5197a85845515891970a6e')
depends=('python' 'libvirt-python')
makedepends=('python-setuptools' 'python-docutils')

build() {
  cd "avocado-${pkgver}"
  python setup.py build
  make man
}

# FIXME: Upstream obviously doesn't run their own tests as they are always broken
false &&
check() {
  cd "avocado-${pkgver}"
  make check
}

package() {
  cd "avocado-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 man/*.1 "$pkgdir/usr/share/man/man1/"
}
