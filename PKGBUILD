# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lightdm-gtk-greeter-git
pkgver=2.0.8.r24.gf8c3500
pkgrel=1
pkgdesc='GTK+ greeter for LightDM'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm-gtk-greeter'
license=('GPL3' 'LGPL3')
depends=('gtk3' 'lightdm' 'libayatana-indicator' 'gdk-pixbuf2')
makedepends=('git' 'exo' 'gnome-common' 'gnome-doc-utils'
             'gobject-introspection' 'intltool')
provides=('lightdm-gtk-greeter')
conflicts=('lightdm-gtk-greeter')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
source=('git+https://github.com/Xubuntu/lightdm-gtk-greeter')
sha256sums=('SKIP')

pkgver() {
  cd lightdm-gtk-greeter

  git describe --long --tags | sed 's/^lightdm-gtk-greeter-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd lightdm-gtk-greeter

  ./autogen.sh \
    --prefix='/usr' \
    --libexecdir='/usr/lib/lightdm' \
    --sbindir='/usr/bin' \
    --sysconfdir='/etc' \
    --with-libxklavier \
    --enable-libido \
    --enable-libindicator \
    --disable-static
  make
}

package() {
  cd lightdm-gtk-greeter

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
