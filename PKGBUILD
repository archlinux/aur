# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
_pkgname=${pkgname%-kde}
pkgver=4.5.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE Plasma's panel"
arch=('i686' 'x86_64')
url='https://github.com/Thulinma/kalu'
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.1' 'pacman<6.2' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
install=kalu.install
sha256sums=('ff568520aeec0fca6dd591f37053a440a5d1044f02fc9f3d31de722dbb848743')
provides=(${_pkgname})
conflicts=(${_pkgname})

build() {
  cd "${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-status-notifier
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}
