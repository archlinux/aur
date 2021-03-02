# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jannik Becher <becher.jannik@gmail.com>

pkgname=rshell
pkgver=0.0.30
pkgrel=1
pkgdesc="A remote shell for working with MicroPython boards."
url="https://github.com/dhylands/rshell"
depends=('python-pyudev' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d2002d40d735204037d6142a6c2d51beecc763c124faaf759cabf7acd945be95')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # Python package and scripts
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # License
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # Documentation
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
