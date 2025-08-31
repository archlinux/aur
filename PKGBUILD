# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: cute.tec@gmail.com

pkgname=xfwm4-git
pkgver=4.20.0+151+g1163ee4a9
pkgrel=1
pkgdesc="Xfce window manager (git version)"
arch=('i686' 'x86_64')
url="https://gitlab.xfce.org/xfce/xfwm4"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck3' 'libxpresent')
makedepends=('git' 'xfce4-dev-tools' 'exo')
provides=('xfwm4')
conflicts=('xfwm4')
source=("git+https://gitlab.xfce.org/xfce/xfwm4.git")
sha256sums=('SKIP')

pkgver() {
  cd xfwm4
  git describe --long --match 'xfwm4-*' | sed 's/xfwm4-//;s/^\([[:digit:]]\)-/\1./;s/-/+/g'
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd xfwm4

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
