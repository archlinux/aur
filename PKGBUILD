# Maintainer: Thulinma <https://aur.archlinux.org/account/Thulinma>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
_pkgname=${pkgname%-kde}
pkgver=4.7.1
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in Wayland / KDE Plasma's panel"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/Thulinma/kalu'
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=7.0.0' 'pacman<8' 'curl' 'libnotify' 'notification-daemon' 'libdbusmenu-gtk3')
makedepends=('perl' 'groff')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
install=kalu.install
sha256sums=('ea3df170d6350fe4fd60c857d8f6d887550662e473fa2dd2d71f519495d2d898')
provides=(${_pkgname})
conflicts=(${_pkgname})

build() {
  cd "${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}
