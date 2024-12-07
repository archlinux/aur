# Maintainer: AaronBlasko <blaskoazzolaaaron@gmail.com>
# Contributor: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcus Andersson <marcus@tojoma-se>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Stefan-Husmann@t-online.de
# Contributor: Army

_pkgname=dunst
pkgname=${_pkgname}-wayland-git
pkgver=1.12.0.r5.ge1e772c
pkgrel=1
pkgdesc="Lightweight and customizable notification daemon (built without X11 suport)"
arch=('i686' 'x86_64' 'armv7h')
url="https://dunst-project.org/"
license=('BSD')
depends=('systemd' 'gdk-pixbuf2' 'pango' 'wayland')
makedepends=('git' 'wayland-protocols' 'libnotify')
optdepends=("libnotify: dunstify"
            "xdg-utils: xdg-open")
provides=('dunst' 'notification-daemon')
conflicts=('dunst')
backup=('etc/xdg/dunst/dunstrc')
source=('git+https://github.com/dunst-project/dunst.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make PREFIX=/usr SYSCONFDIR=/etc/xdg
}

package() {
  cd "${_pkgname}"
  make X11=0 DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc/xdg install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
