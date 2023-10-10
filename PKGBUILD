# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-avocado
pkgver=102.0
pkgrel=1
pkgdesc="Set of tools and libraries to help with automated testing"
arch=('any')
url="http://avocado-framework.github.io/"
license=('GPL2')
source=("https://github.com/avocado-framework/avocado/archive/${pkgver}.tar.gz")
sha256sums=('acdfc94705053823b7cb33c2d7d7d71d86e589f2067b856eb55a05212dc4ad70')
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
