# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm-git
pkgver=0.7.5.r0.g485e37d
pkgrel=1
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/adwm"
license=('GPL')
provides=('adwm')
conflicts=('adwm')
depends=('libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'libxcomposite' 'libxdamage' 'libjpeg-turbo' 'libsvg-cairo')
optdepends=('xdg-launch-git: for application launching key bindings'
            'xde-ctools-git: for xde-run, xde-winmenu, xde-winlist and xde-wkspmenu default bindings'
            'xde-menu-git: for xde-menu root menu default bindings'
            'xde-session-git: for xde-logout and xde-xlock default bindings')
options=('!libtool' '!strip' 'debug')
makedepends=('git' 'perl-timedate')
source=("$pkgname::git+https://github.com/bbidulock/adwm")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
