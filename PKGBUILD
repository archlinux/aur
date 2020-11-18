# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sh4nks <sh4nks7@gmail.com

pkgname=lightdm-pantheon-greeter-git
pkgver=5.0.4.r38.fd23540
pkgrel=1
pkgdesc='Pantheon greeter for LightDM'
arch=(x86_64)
url=https://github.com/elementary/greeter
license=(GPL)
groups=(pantheon-unstable)
depends=(
  accountsservice
  gtk3
  lib{gee,gl,granite.so,handy}
  lightdm
)
makedepends=(
  meson
  git
  lib{glvnd,xfixes}
  mutter
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
