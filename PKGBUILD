# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcus Andersson <marcus@tojoma-se>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Stefan-Husmann@t-online.de
# Contributor: Army

_pkgname=dunst
pkgname=${_pkgname}-git
pkgver=1.9.0.r3.g1ef38e5
pkgrel=1
pkgdesc="A highly configurable and lightweight notification daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://dunst-project.org/"
license=('BSD')
depends=('systemd' 'gdk-pixbuf2' 'pango' 'libxss' 'libxinerama' 'libxrandr' 'wayland')
makedepends=('git' 'wayland-protocols' 'libnotify')
optdepends=("libnotify: dunstify"
            "xdg-utils: xdg-open")
provides=('dunst' 'notification-daemon')
conflicts=('dunst')
backup=('etc/xdg/dunst/dunstrc')
source=('git+https://github.com/dunst-project/dunst.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make PREFIX=/usr SYSCONFDIR=/etc/xdg
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc/xdg install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
