# Maintainer: Fabio Loli
# Contributor: Jonas Malaco <jonas@protocubo.io>
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-rc
pkgver=1.2.0rc4
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices, RC release"
arch=(any)
url="https://github.com/jonasmalacofilho/liquidctl"
license=(GPL3)
depends=(python python-setuptools python-docopt python-pyusb python-hidapi python-appdirs)
makedepends=()
provides=(python-liquidctl)
conflicts=(python-liquidctl)
source=("https://files.pythonhosted.org/packages/source/l/liquidctl/liquidctl-${pkgver}.tar.gz")
sha256sums=('da136da290fa1873d29285c5e01147423e1ada8529982ef360b77f753aef375d')

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
