# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=typhoon-git
_pkgname=typhoon
pkgver=v0.9.5.r2.g5ea0092
pkgrel=4
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
provides=($_pkgname)
conflicts=($_pkgname)
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick' 'python-dbus' 'libportal' 'python-cairosvg')
makedepends=('git' 'meson' 'ninja')
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" meson install -C build
}
