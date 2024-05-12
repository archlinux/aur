# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.1.2
pkgrel=1
pkgdesc='GUI wallpaper setter for both Wayland and X11 window managers that works as a frontend for popular backends like swaybg, swww, and feh.'
arch=('any')
url='https://github.com/anufrievroman/waypaper'
license=('GPL-3.0-only')
depends=('gtk3' 'gdk-pixbuf2' 'python-gobject' 'python-importlib-metadata' 'python-platformdirs' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('swaybg: the wayland backend that supports only static images'
            'swww: the wayland backend that supports animated GIFs'
            'feh: the x11 backend that supports static images'
            'wallutils: another x11 backend')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b0ba40bd6cf739a33f782e25c51503ad329856b04fb28360922748b124901993cd0a8faa68b633d24628fd14fb7789c6eaa1ffd3d470921c2e05d1f5ab4b1b17')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
