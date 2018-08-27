pkgname=pycp
pkgver="8.0.6"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python' 'python-cli-ui' 'python-attrs')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/fa/2c/b01afb9eacaaeef8c9a733080da62c68545bdbced3c07ae78faad95d3af0/pycp-8.0.6.tar.gz')
checkdepends=('python-pytest' 'python-pytest-mock')

sha256sums=('c2960604585ef392cdc1185a094409d5132b9630b0c0bf4d56bac7f00fb40c65')


build() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py build
}

check() {
  cd ${srcdir}/pycp-${pkgver}
  PYTHONPATH=. pytest
}

package() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # license
  mkdir -p $pkgdir/usr/share/licenses/pycp
  install COPYING.txt $pkgdir/usr/share/licenses/pycp/COPYING
}

# vim:set ts=2 sw=2 et:
