# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz93@gmail.com>

pkgname='python-dukpy'
pkgver=0.3
pkgrel=7
pkgdesc="Python bindings for the duktape embeddable JavaScript engine"
arch=('x86_64')
url="https://github.com/kovidgoyal/dukpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("dukpy-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cc78c39ebba51f381c623b164cfb7dcf3caddf515fe7094bc53b7eca5d4e435e')

build() {
  cd "${srcdir}/dukpy-${pkgver}"

  python setup.py build
}

package_python-dukpy() {
  cd "dukpy-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-dukpy/LICENSE.txt"
}

check() {
  cd "dukpy-${pkgver}"
  python setup.py test
}
