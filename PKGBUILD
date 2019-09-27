# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-rc
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices (include RCs)"
arch=(any)
url="https://github.com/jonasmalacofilho/liquidctl"
license=(GPL3)
depends=(python python-setuptools python-docopt python-pyusb python-hidapi python-appdirs)
makedepends=()
provides=(python-liquidctl)
conflicts=(python-liquidctl)
source=("https://files.pythonhosted.org/packages/source/l/liquidctl/liquidctl-${pkgver}.tar.gz")
sha256sums=('ad8c03c0695620fedaec11e7a8286bb5d4da18ba0c71e55888bfa06f8f7d7529')

build() {
  cd "${srcdir}/liquidctl-${pkgver}"
  export DIST_NAME="$(source /etc/os-release && echo $PRETTY_NAME)"
  export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"
  python setup.py build
}

package() {
  cd "${srcdir}/liquidctl-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
