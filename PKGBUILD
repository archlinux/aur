# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.5
pkgrel=1
pkgdesc='GUI wallpaper setter for Wayland and Xorg window managers. It works as a frontend for popular wallpaper backends like swaybg, swww, wallutils, hyprpaper and feh.'
arch=('any')
url='https://github.com/anufrievroman/waypaper'
license=('GPL-3.0-only')
depends=('gtk3'
         'gdk-pixbuf2'
         'python-gobject'
         'python-imageio'
         'python-imageio-ffmpeg'
         'python-pillow'
         'python-platformdirs'
         'python-screeninfo')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('feh: the x11 backend that supports static images'
            'hyprpaper: the wayland backend with IPC controls'
            'mpvpaper: support for videos'
            'swaybg: the wayland backend that supports only static images'
            'swww: the wayland backend that supports animated GIFs'
            'wallutils: another x11 backend')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ed9057e570429975bfa9c5e9f4c48e6d21b50894383bc5d2092399553bbdd39ffdfdb3aad5ada3c279e1f1e886685b3a7e1e621e5c6695db79b755ce1617ff7f')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
