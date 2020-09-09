# Maintainer: getzze <getzze at gmail dot com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=python-feedparser-dev
pkgname=('python-feedparser-dev' 'python-sgmllib3k')
pkgver=6.0.0b3
pkgrel=1
pkgdesc="Parse RSS and Atom feeds in Python: development version"
arch=('any')
url="https://github.com/kurtmckee/feedparser/"
license=('custom')
provides=('python-feedparser')
conflicts=('python-feedparser')
makedepends=('python' 'libxml2' 'python-setuptools')
depends=('python' 'libxml2')
source=(feedparser-${pkgver}.tar.gz::https://github.com/kurtmckee/feedparser/archive/${pkgver}.tar.gz
        https://files.pythonhosted.org/packages/source/s/sgmllib3k/sgmllib3k-1.0.0.tar.gz)
sha256sums=('1387970fb350a084ad31a55c2a1a5646214b7fd3b726a7f9c6e5d9bd63412710'
            '7868fb1c8bfa764c1ac563d3cf369c381d1325d36124933a726f29fcdaa812e9')


build() {
  cd "${srcdir}/sgmllib3k-1.0.0"
  python /usr/lib/python3.8/compileall.py sgmllib.py
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

  cd "${srcdir}/sgmllib3k-1.0.0"
  install -Dm644 sgmllib.py \
    "${pkgdir}/usr/lib/python3.8/site-packages/sgmllib.py"
  install -Dm644 __pycache__/sgmllib.cpython-38.pyc \
    "${pkgdir}/usr/lib/python3.8/site-packages/__pycache__/sgmllib.cpython-38.pyc"
}

