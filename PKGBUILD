# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=waypaper-git
pkgver=r3.g69317da
pkgrel=1
pkgdesc='GUI wallpaper setter for Wayland'
arch=('any')
url='https://github.com/anufrievroman/waypaper'
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'python-gobject' 'swaybg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-*}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${pkgname%-*}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
