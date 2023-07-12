# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

# On Debian there is v2.2.1-3.1, same developer (smurfix)
# https://packages.debian.org/sid/yapps2

pkgname=python-yapps2
_pkgver=2.2.1-3
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Yet Another Python Parser System, Python3 fork by smurfix"
arch=(any)
url="https://github.com/smurfix/yapps"
license=(MIT)
depends=(python python-importlib-metadata python-setuptools)
#makedepends=(python-setuptools)
#checkdepends=(python-pytest)
source=("${pkgname}-debian-${pkgver}.tar.gz::https://github.com/smurfix/yapps/archive/refs/tags/DEBIAN-${_pkgver}.tar.gz")
sha256sums=('fce35c50920a8bf6dab10e83e29228acdb860147eeb47cdfe082578c5ed13789')

build() {
  cd "${srcdir}/yapps-DEBIAN-${_pkgver}"
  python setup.py build
}

#check() {
#  cd "${srcdir}/yapps-DEBIAN-${_pkgver}"
#  pytest -v
#}

package() {
  cd "${srcdir}/yapps-DEBIAN-${_pkgver}"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
