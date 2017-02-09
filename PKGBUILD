# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: cute.tec@gmail.com

pkgname=xfwm4-git
pkgver=4.12.0+237+g03c4b509
pkgrel=1
pkgdesc="Xfce window manager (git version)"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/xfwm4"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck' 'libxpresent')
makedepends=('git' 'xfce4-dev-tools' 'exo')
provides=('xfwm4')
conflicts=('xfwm4')
source=("git://git.xfce.org/xfce/xfwm4") # TODO: https
sha256sums=('SKIP')

pkgver() {
  cd xfwm4
  git describe --long | sed 's/xfwm4-//;s/-/+/g'
}

prepare() {
  cd xfwm4

  # https://bugzilla.xfce.org/show_bug.cgi?id=12534
  git revert --no-commit 0dfb55407a830572f03297b3c118fac1f3c5b80d
}

build() {
  cd xfwm4

  ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-dependency-tracking \
    --disable-static \
    --enable-epoxy \
    --enable-startup-notification \
    --enable-xsync \
    --enable-render \
    --enable-randr \
    --enable-xpresent \
    --enable-compositor \
    --disable-debug
  make
}

package() {
  cd xfwm4

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
