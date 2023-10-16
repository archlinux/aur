# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=1.4.0
pkgrel=2
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL3')
makedepends=('meson' 'npm')
depends=('glib2' 'libpulse' 'glibc' 'typescript' 'gjs' 'gtk3' 'gtk-layer-shell' 'gobject-introspection')
optdepends=('gnome-bluetooth-3.0: required for bluetooth service'
            'upower: required for battery service'
            'networkmanager: required for network service'
            'libdbusmenu-gtk3: required for systemtray service')
conflicts=('aylurs-gtk-shell-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aylur/ags/releases/download/v${pkgver}/ags-v${pkgver}.tar.gz")
sha256sums=('e96dd7ffc591580265138ff0c55c9f1d182a8b06585a14e33e61817dd559081f')

build() {
  cd $srcdir/$_pkgname
  npm install
  arch-meson build --libdir "lib/$pkgname"
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
