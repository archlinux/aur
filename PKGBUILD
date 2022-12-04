# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
_pkgname=${pkgname%-kde}
pkgver=4.4.1
pkgrel=2
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE Plasma's panel"
arch=('i686' 'x86_64')
url='https://github.com/Thulinma/kalu'
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.0' 'pacman<6.1' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
install=kalu.install
sha256sums=('d6135599ebc184e109e03c587ecb024e0c0c561d180e9593292fc7e1099794bb')
provides=(${_pkgname})
conflicts=(${_pkgname})

prepare() {
  cd "${_pkgname}-${pkgver}"
}

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
