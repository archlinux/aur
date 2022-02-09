# Contributor: Colin Jones (xentalion) <colin@ergoeclectic.com>
# Maintainer: Valère Monseur <archlinux at vale dot re>

_pkgname=cbatticon
pkgname=cbatticon-git
pkgver=1.6.12.r0.g63aaeaa
pkgrel=1
pkgdesc='Lightweight battery icon for the system tray'
arch=(x86_64 i686)
url='https://github.com/valr/cbatticon'
license=(GPL2)
depends=(gtk3 libnotify)
makedepends=(git)
provides=(cbatticon)
conflicts=(cbatticon)

source=("$_pkgname"::'git+https://github.com/valr/cbatticon.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "$_pkgname" WITH_NOTIFY=1 WITH_GTK3=1
}

package() {
  make -C "$_pkgname" PREFIX="$pkgdir/usr" install
}
