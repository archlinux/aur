# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper
pkgver=2.6
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
sha512sums=('25d7c2022a5c00091539bc799e1f3faf0774a69b767c34396b55200e7d48275abe4b72c3e6c23a99730c9d6d43f9ba1bc082b1054d72a799d8839bad88637ba6')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
