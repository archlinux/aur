# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.3
pkgrel=1
pkgdesc='GUI wallpaper setter for Wayland and Xorg window managers. It works as a frontend for popular wallpaper backends like swaybg, swww, wallutils, hyprpaper and feh.'
arch=('any')
url='https://github.com/anufrievroman/waypaper'
license=('GPL-3.0-only')
depends=('gtk3' 'gdk-pixbuf2' 'python-gobject' 'python-importlib-metadata' 'python-platformdirs' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('swaybg: the wayland backend that supports only static images'
            'swww: the wayland backend that supports animated GIFs'
            'feh: the x11 backend that supports static images'
            'wallutils: another x11 backend'
            'hyprpaper: the wayland backend with IPC controls')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ea9035e1b66bfc5bd1440e14289beaeebc23c5c2759a91f91b93e8713ff2251d9b9845b9aacf3064600df5aaa3d45933e1c7a6be8a0e711f6f687ff589f163af')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
