# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=lightdm-gtk-greeter-devel
pkgver=2.0.2
pkgrel=1
pkgdesc='GTK+ greeter for LightDM'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm-gtk-greeter'
license=('GPL3' 'LGPL3')
depends=('gtk3' 'lightdm')
makedepends=('exo' 'gnome-common' 'gnome-doc-utils' 'gobject-introspection'
             'intltool')
provides=('lightdm-gtk-greeter')
conflicts=('lightdm-gtk-greeter')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
install='lightdm-gtk-greeter.install'
source=("https://launchpad.net/lightdm-gtk-greeter/${pkgver%.?}/${pkgver}/+download/lightdm-gtk-greeter-${pkgver}.tar.gz")
sha256sums=('8ee6d93d1d6837b3590f64ac4d5bac5db888a8861dff1cb2ef10f7816ad36690')

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
