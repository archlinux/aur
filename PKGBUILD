# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jannik Becher <becher.jannik@gmail.com>

pkgname=rshell
pkgver=0.0.28
pkgrel=2
pkgdesc="A remote shell for working with MicroPython boards."
url="https://github.com/dhylands/rshell"
depends=('python-pyudev' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d28e6bd872734c68a2b6169adf43b6f71c745fa66ec89ae88a975e38c1a636b3')

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
