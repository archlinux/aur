# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.9
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
sha512sums=('b1baeccc6fceceb0ff94ed35c23bc7ec28c985740387ed8bf8ec24b41e7a875938352c4668dd5470bb4679860bb9001080cf1388651cfd563c55d36af12d795c')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
