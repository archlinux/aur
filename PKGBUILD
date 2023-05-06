# Maintainer: Jose Riha < jose 1711 gmail com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thom Wiggers <thom@thomwiggers.nl>

_base=pympress
pkgname=python-${_base}
pkgdesc="Simple and powerful dual-screen PDF reader designed for presentations"
pkgver=1.8.2
pkgrel=2
arch=(any)
url="https://github.com/Cimbali/${_base}"
license=(GPL)
depends=(poppler-glib gtk3 python-cairo gdk-pixbuf2 python-gobject gobject-introspection python-watchdog perl-x11-protocol perl-net-dbus)
makedepends=(python-build python-installer python-setuptools python-wheel python-babel)
optdepends=('vlc: for play videos'
  'python-vlc: for play videos'
  'gstreamer: for play videos')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1327d2a4fab31ea0db21076849faa78685025fb5339fffbfac8c5489488951f373e48effc1f6ec0d5b8dfd753115d482cb4e4873d9edb7443a664a44d1153897')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
