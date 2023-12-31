# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper-git
pkgver=2.0.3.r0.g0733122
pkgrel=2
pkgdesc='GUI wallpaper setter for both Wayland and X11 window managers that works as a frontend for popular backends like swaybg, swww, and feh.'
arch=('any')
url='https://github.com/anufrievroman/waypaper'
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'python-gobject' 'python-importlib-metadata' 'python-platformdirs' 'python-pillow')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('swaybg: the wayland backend that supports only static images'
            'swww: the wayland backend that supports animated GIFs'
            'feh: the x11 backend that supports static images'
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
