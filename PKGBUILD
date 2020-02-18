# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-rc
pkgver=1.3.3
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
arch=(any)
url="https://github.com/jonasmalacofilho/liquidctl"
license=(GPL3)
depends=(python python-setuptools python-docopt python-pyusb python-hidapi)
makedepends=()
provides=(python-liquidctl)
conflicts=(python-liquidctl)
source=("https://files.pythonhosted.org/packages/source/l/liquidctl/liquidctl-${pkgver}.tar.gz")
sha256sums=('d13180867e07420c5890fe1110e8f45fe343794549a9ed7d5e8e76663bc10c24')

build() {
  cd "${srcdir}/liquidctl-${pkgver}"
  export DIST_NAME="$(source /etc/os-release && echo $PRETTY_NAME)"
  export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"
  python setup.py build
}

package() {
  cd "${srcdir}/liquidctl-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 liquidctl.8 "$pkgdir/usr/share/man/man8/liquidctl.8"
}
