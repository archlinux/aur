# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgrel=1
pkgver=1
pkgname=dwm-autolinux
_pkgbase=dwm
pkgdesc="AutoLinux - Suckless DWM Build"
arch=('x86_64')
url="https://gitlab.com/a4to/dwm"
license=('MIT')
depends=('libxft')
makedepends=('git')
optdepends=(
    'xorg-xrandr: Allows for changing the resolution of the screen'
    'xwallpaper:  Allows for setting a wallpaper'
    'lxappearance: Allows for changing the theme of the window manager'
    'xorg-xsetroot: Allows for changing the background color of the bar and WM'
    'xorg-xbacklight: Allows for changing the brightness of the screen'
  )
provides=(dwm)
conflicts=(dwm)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "6.2.r.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgbase}"
	NAME="${pkgname}" make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgbase}"
	NAME="${pkgname}" make PREFIX=/usr DESTDIR="${pkgdir}" clean install
}
