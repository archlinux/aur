# Maintainer: getzze <getzze at gmail dot com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=python-feedparser-dev
pkgname=('python-feedparser-dev' 'python-sgmllib3k')
pkgver=6.0.2
pkgrel=3
_sgmllib3k_ver=1.0.0
pkgdesc="Parse RSS and Atom feeds in Python: development version"
arch=('any')
url="https://github.com/kurtmckee/feedparser/"
license=('custom')
provides=('python-feedparser')
conflicts=('python-feedparser')
makedepends=('python' 'libxml2' 'python-setuptools')
depends=('python' 'libxml2')
source=(feedparser-${pkgver}.tar.gz::https://github.com/kurtmckee/feedparser/archive/${pkgver}.tar.gz
        https://files.pythonhosted.org/packages/source/s/sgmllib3k/sgmllib3k-${_sgmllib3k_ver}.tar.gz)
sha256sums=('b211cfb80c4daefca64b773ade77340727187564fad9c2c94b37da8e1f03788f'
            '7868fb1c8bfa764c1ac563d3cf369c381d1325d36124933a726f29fcdaa812e9')


build() {
  cd "${srcdir}/sgmllib3k-${_sgmllib3k_ver}"
  python /usr/lib/$(readlink /usr/bin/python3)/compileall.py sgmllib.py
}

package_python-feedparser-dev() {
  depends=('libxml2' 'python-sgmllib3k')

  cd "${srcdir}/feedparser-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license"
}

package_python-sgmllib3k() {
  depends=('python')
  provides=('python-sgmllib')
  conflicts=('python-sgmllib')
  pkgdesc="Port of sgmllib to Python3"
  license=('PSF')

  cd "${srcdir}/sgmllib3k-${_sgmllib3k_ver}"
  python setup.py install --root="${pkgdir}"
}

