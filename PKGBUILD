# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.8
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
            'awww: the wayland backend that supports animated GIFs'
            'wallutils: another x11 backend')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('fb2b44d1bd9b3681c9cd5bb96b58e81b1d40c7665bb09ab7699a8fb9f8064b961c261826c0037247fc524eef585e62678a1339bfb65985e903c976203f885147')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
