# Maintainer: Pezcurrel <pezcurrel@tiscali.it>
# Contributor: Pezcurrel <pezcurrel@tiscali.it>
# Maintainer: Maxime Gauduin <alucrydarchlinux.org>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=lightdm-gtk-greeter-cancellable-autologin
pkgver=2.0.9
pkgrel=3
epoch=1
pkgdesc='GTK+ greeter for LightDM with cancellable autologin patch'
arch=(x86_64)
url=https://github.com/pezcurrel/lightdm-gtk-greeter
license=(
  GPL3
  LGPL3
)
depends=(
  gtk3
  lightdm
)
makedepends=(
  exo
  git
  gobject-introspection
  intltool
  xfce4-dev-tools
)
_tag=lightdm-gtk-greeter-2.0.9-cancellable-autologin-1
provides=('lightdm-gtk-greeter')
conflicts=('lightdm-gtk-greeter' 'lightdm-gtk-greeter-git')
backup=(etc/lightdm/lightdm-gtk-greeter.conf)
source=(git+${url}.git#tag=${_tag})
sha256sums=(SKIP)

prepare() {
  cd lightdm-gtk-greeter
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd lightdm-gtk-greeter
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/lightdm \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-libxklavier \
    --enable-kill-on-sigterm \
    --disable-at-spi-command \
    --disable-indicator-services-command \
    --disable-libido \
    --disable-libindicator \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C lightdm-gtk-greeter install
}

# vim: ts=2 sw=2 et:
