# Maintainer: sergeyhist <sergeyhist at yahoo dot com>

pkgname=budgie-screensaver-git
pkgver=3.6.0.r51.g5631e15
pkgrel=1
pkgdesc="Budgie's fork of GNOME's legacy screensaver"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/getsolus/budgie-screensaver"
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('git' 'intltool' 'gnome-common')
optdepends=('gnome-backgrounds: default background')
provides=('gnome-screensaver' 'budgie-screensaver')
conflicts=('gnome-screensaver' 'budgie-screensaver')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}