pkgname=gnome-packagekit-git
_pkgname=gnome-packagekit
pkgver=3.32.0+5+gfcd32a84
pkgrel=1
pkgdesc='Collection of graphical tools for PackageKit to be used in the GNOME desktop'
arch=('x86_64')
url='http://www.packagekit.org/'
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'libnotify' 'packagekit')
makedepends=('intltool' 'itstool' 'docbook-xsl' 'libcanberra')
provides=('gnome-packagekit')
conflicts=('gnome-packagekit')
install=gnome-packagekit.install
source=("git+https://gitlab.gnome.org/GNOME/gnome-packagekit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
