# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=lightdm-gtk-greeter-devel
pkgver=2.0.0
pkgrel=1
pkgdesc='GTK+ greeter for LightDM'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm-gtk-greeter'
license=('GPL3' 'LGPL3')
depends=('gtk3' 'lightdm')
makedepends=('gnome-common' 'gnome-doc-utils' 'gobject-introspection'
             'intltool')
provides=('lightdm-gtk-greeter')
conflicts=('lightdm-gtk-greeter')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
install='lightdm-gtk-greeter.install'
source=("https://launchpad.net/lightdm-gtk-greeter/${pkgver%.?}/${pkgver}/+download/lightdm-gtk-greeter-${pkgver}.tar.gz")
sha256sums=('4c0a0121d1ec82c85c8aed4ad80ebd48ddc56d9bace31da72423bfd330c26484')

build() {
  cd lightdm-gtk-greeter-${pkgver}

  ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/lightdm' \
    --sbindir='/usr/bin' \
    --sysconfdir='/etc' \
    --with-libxklavier \
    --disable-libido \
    --disable-libindicator \
    --disable-static
  make
}

package() {
  cd lightdm-gtk-greeter-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
