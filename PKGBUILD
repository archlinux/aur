# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgrel=1
pkgver=6.2.r.53
_pkgbase=dwm
pkgname=dwm-nu1ll1nux
pkgdesc="Concise Build of Suckless DWM"
arch=('x86_64')
url="https://gitlab.com/qYp/dwm"
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
backup=(usr/bin/dwm.bak)
source=("git+$url.git")
sha256sums=('SKIP')

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
	NAME="${pkgname}" make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 Nu1LL1nuX-DWM.desktop "${pkgdir}/usr/share/xsessions/Nu1LL1nuX-DWM.desktop"
}
