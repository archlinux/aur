# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=pamac-gaura-git
pkgver=r579.dca26af
pkgrel=4
pkgdesc="A Gtk3 frontend for libalpm with some additions from gaurapanasenko"
arch=('any')
url="https://github.com/gaurapanasenko/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'gnutls>=3.4')
  optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
              'lxsession: needed for authentification in Xfce, LXDE etc.'
              'yaourt: needed for AUR support'
              'pamac-tray-appindicator: tray icon for KDE')
makedepends=('git' 'gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
conflicts=('pamac')
provides=('pamac')
options=(!emptydirs)

source=("git://github.com/gaurapanasenko/pamac.git#branch=switchinstallreason"
	"pamac-orphans-disable-optional.patch")
sha256sums=('SKIP'
	    '08cdfa1f3b834bec7bd550b43ab43ab216dd24a302465519a42bc857de4e6dce')

prepare() {
  cd "$srcdir/pamac"
  patch -Np1 -i "${srcdir}/pamac-orphans-disable-optional.patch"
}

build() {
  cd "$srcdir/pamac"

  # build
  make all
}

package() {
  cd "$srcdir/pamac"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}
# vim:set ts=2 sw=2 et:
