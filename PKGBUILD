# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell
_pkgname=ags
pkgver=1.7.6
pkgrel=1
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL3')
makedepends=('gobject-introspection' 'meson' 'npm' 'typescript')
depends=('gjs' 'glib2' 'glibc' 'gtk3' 'gtk-layer-shell' 'libpulse' 'pam')
optdepends=('gnome-bluetooth-3.0: required for bluetooth service'
            'greetd: required for greetd service'
            'libdbusmenu-gtk3: required for systemtray service'
            'libsoup3: required for the Utils.fetch feature'
            'libnotify: required for sending notifications'
            'networkmanager: required for network service'
            'power-profiles-daemon: required for powerprofiles service'
            'upower: required for battery service')
conflicts=('aylurs-gtk-shell-git')
backup=('etc/pam.d/ags')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Aylur/ags/releases/download/v${pkgver}/ags-v${pkgver}.tar.gz")
sha256sums=('be009fa188552be44a0ae309a8e697f331db59e4ae8b137d4834b37218ea8207')

build() {
  cd $srcdir/$_pkgname
  npm install
  arch-meson build --libdir "lib/$_pkgname" -Dbuild_types=true
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
  ln -sf /usr/share/com.github.Aylur.ags/com.github.Aylur.ags ${pkgdir}/usr/bin/ags
}
