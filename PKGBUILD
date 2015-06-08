# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=light-locker-git
pkgver=1.4.0.r5.f45fdd4
pkgrel=1
pkgdesc='A simple session locker'
arch=('i686' 'x86_64')
url='https://github.com/the-cavalry/light-locker'
license=('GPL2')
depends=('dbus-glib' 'gtk3' 'libxss' 'libxxf86misc' 'lightdm')
makedepends=('git' 'gnome-common' 'intltool')
provides=('light-locker')
conflicts=('light-locker')
install='light-locker.install'
source=('git+https://github.com/the-cavalry/light-locker.git')
sha256sums=('SKIP')

pkgver() {
  cd light-locker

  printf "%s" "$(git describe --tags | sed 's/-/.r/; s/-g/./; s/^v//')"
}

build () {
  cd light-locker

  ./autogen.sh \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-schemas-compile \
    --disable-static \
    --with-{mit-ext,systemd,xf86gamma-ext,x} \
    --without-{console-kit,upower}
  make
}

package() {
  cd light-locker

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
