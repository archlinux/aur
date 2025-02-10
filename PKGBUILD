# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper-git
pkgver=2.5.r0.g3ce8658
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
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('feh: the x11 backend that supports static images'
            'hyprpaper: the wayland backend with IPC controls'
            'mpvpaper: support for videos'
            'swaybg: the wayland backend that supports only static images'
            'swww: the wayland backend that supports animated GIFs'
            'wallutils: another x11 backend')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname%-*}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
