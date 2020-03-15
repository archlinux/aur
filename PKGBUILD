# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter-git
pkgver=5.0.2.r7.39a7f08
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=(x86_64)
url=https://github.com/elementary/greeter
license=(GPL)
groups=(pantheon-unstable)
depends=(
  accountsservice
  cairo
  gdk-pixbuf2
  glib2
  gtk3
  mutter
  libgee
  libgl
  libgranite.so
  libx11
  lightdm
)
makedepends=(
  meson
  git
  granite
  libglvnd
  libxfixes
  vala
)
provides=(lightdm-pantheon-greeter)
conflicts=(lightdm-pantheon-greeter)
install=lightdm-pantheon-greeter.install
source=(lightdm-pantheon-greeter::git+https://github.com/elementary/greeter.git)
sha256sums=(SKIP)

pkgver() {
  cd lightdm-pantheon-greeter

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson lightdm-pantheon-greeter build \
    -D ubuntu-patched-gsd=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
