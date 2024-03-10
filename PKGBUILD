# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=avocado-framework
pkgver=103.0
pkgrel=1
pkgdesc="Set of tools and libraries to help with automated testing"
arch=('any')
url="http://avocado-framework.github.io/"
license=(GPL-2.0-or-later)
provides=(python-avocado=$pkgver avocado=$pkgver python-avocado-framework=$pkgver)
conflicts=(python-avocado)
depends=('python' 'libvirt-python' 'python-setuptools')
makedepends=('python-docutils')
source=("https://github.com/avocado-framework/avocado/archive/${pkgver}.tar.gz")
sha256sums=('c502c3014062be32ab6c92bf089cad661c1be56992269bacdc68aa6e204dcabc')

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
