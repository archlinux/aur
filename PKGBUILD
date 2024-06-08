# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.2
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
sha512sums=('c86d771b6b65b3ccccbb51ad063de99314581552f5b08ac47d0a86046db9689636d032fdfb2919e325de5ee6de6b3821084f9f5bcfbe9a2cf79af620c60d761d')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
