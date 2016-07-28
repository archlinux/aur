# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-flashback-git
_pkgname=gnome-flashback
pkgver=3.20.1.r39.ga130f67
pkgrel=1
pkgdesc="GNOME Flashback session (git version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/GnomeFlashback"
license=('GPL')
depends=('gnome-bluetooth' 'gnome-panel' 'gnome-session' 'gnome-settings-daemon' 'gnome-themes-standard' 'libibus' 'metacity' 'nautilus')
makedepends=('git' 'autoconf-archive' 'intltool' 'python2')
optdepends=('gnome-backgrounds: Default background'
            'gnome-control-center: System settings'
            'gnome-screensaver: Lock screen'
            'network-manager-applet: Network management')
conflicts=($_pkgname)
provides=($_pkgname)
source=(git://git.gnome.org/$_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
               --disable-schemas-compile --disable-Werror
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
