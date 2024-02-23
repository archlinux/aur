# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.1
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
sha512sums=('87c76e0e43bb9d3e4698fdf193cc8be9191001a3022943319856249d119d4ca60a45f44dd8cd71246cadb535deadf59b11f995275b627a1f1c380273b1324ea6')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
