# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-extras-menu-plugin
pkgname=${_pkgname}-git
pkgver=r72.611c300
pkgrel=1
pkgdesc="XFCE panel plugin similar to GNOME's Quick Settings menu"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
_url='https://github.com/Alperen42v/extra-xfce4-plugins'
url='https://github.com/Alperen42v/extra-xfce4-plugins/tree/main/extras-menu-plugin'
license=('GPL-3.0-or-later')
depends=('xfce4-panel' 'brightnessctl' 'libpulse')
makedepends=('git')
provides=("${_pkgname}")
conflicts=(${_pkgname})
source=(git+${_url})
sha512sums=('SKIP')

pkgver() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  printf 'r%s.%s' "$( git rev-list --count HEAD )" "$( git rev-parse --short HEAD )"
#  git describe --long --tags | sed "s|xfce4-docklike-plugin-||g" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  make
}

package() {
  cd extra-xfce4-plugins/${_pkgname/xfce4-/}
  install -Dm755 build/libextras-menu.so "${pkgdir}"/usr/lib/xfce4/panel/plugins/libextras-menu.so
  install -Dm644 extras-menu.desktop "${pkgdir}"/usr/share/xfce4/panel/plugins/extras-menu.desktop
}
