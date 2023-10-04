# Maintainer: Jose Riha < jose 1711 gmail com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thom Wiggers <thom@thomwiggers.nl>

_base=pympress
pkgname=python-${_base}
pkgdesc="Simple and powerful dual-screen PDF reader designed for presentations"
pkgver=1.8.4
pkgrel=1
arch=(any)
url="https://github.com/Cimbali/${_base}"
license=(GPL)
depends=(poppler-glib gtk3 python-cairo gdk-pixbuf2 python-gobject gobject-introspection python-watchdog perl-x11-protocol perl-net-dbus)
makedepends=(python-build python-installer python-setuptools python-wheel python-babel)
optdepends=('vlc: for play videos'
  'python-vlc: for play videos'
  'gstreamer: for play videos')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5fb80095639f36e3c53c9dea7df33ee40a2f3648a6825b2b3a5ee0b93e7382a6410668f775bcac536b03c54ee247c09499da8979896f81b42cc378deedeb5910')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
