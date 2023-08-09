# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper-git
pkgver=1.2.r3.g9663f1d
pkgrel=1
pkgdesc='GUI wallpaper setter for Wayland-based window managers that works as a frontend for popular backends like swaybg and swww.'
arch=('any')
url='https://github.com/anufrievroman/waypaper'
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'python-gobject')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('swaybg: wallpaper tool for Wayland compositors'
            'swww: backend for animated wallpaper')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url.git")
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
