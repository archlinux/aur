# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=typhoon-git
_pkgname=typhoon
pkgver=r103.gdf1fe35
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
provides=($_pkgname)
conflicts=($_pkgname)
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick')
makedepends=('git' 'meson' 'ninja')
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Generate a valid version string by replacing invalid characters
  git describe --tags --long 2>/dev/null | sed 's/-/./g' || echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
