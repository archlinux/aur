# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgbase='python-dukpy'
pkgname=('python-dukpy' 'python2-dukpy')
pkgver=0.3
pkgrel=1
pkgdesc="Python bindings for the duktape embeddable JavaScript engine"
arch=('i686' 'x86_64')
url="https://github.com/kovidgoyal/dukpy"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("dukpy-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cc78c39ebba51f381c623b164cfb7dcf3caddf515fe7094bc53b7eca5d4e435e')

build() {
  cd "${srcdir}/dukpy-${pkgver}"

  python setup.py build
  python2 setup.py build
}

package_python-dukpy() {
  depends=('python')

  cd "${srcdir}/dukpy-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-dukpy/LICENSE.txt"
}

package_python2-dukpy() {
  depends=('python2')

  cd "${srcdir}/dukpy-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-dukpy/LICENSE.txt"
}
