# Maintainer: Jose Riha < jose 1711 gmail com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thom Wiggers <thom@thomwiggers.nl>
_base=pympress
pkgname=python-${_base}
pkgdesc="Simple and powerful dual-screen PDF reader designed for presentations"
pkgver=1.8.6
pkgrel=1
arch=(any)
url="https://github.com/Cimbali/${_base}"
license=(GPL-2.0-or-later)
depends=(poppler-glib gtk3 python-cairo gdk-pixbuf2 python-gobject
  gobject-introspection python-watchdog perl-x11-protocol perl-net-dbus)
makedepends=(python-build python-installer python-setuptools python-wheel python-babel)
optdepends=('vlc: for playing videos'
  'python-vlc: for playing videos'
  'gstreamer: for playing videos'
  'gst-plugin-gtk: for playing videos')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7d4c176e7ba8a6d5cd11c12a14ac42057ddc5f3abba75d56a36f97865e890470584def2dffc63fcd66c504f642631cffe6f1d0b76302ee523392d541c058670b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname}"
}
