# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf
pkgver=0.40.0
pkgrel=2
pkgdesc='A low-level configuration system'
arch=(x86_64)
url=https://live.gnome.org/dconf
license=(LGPL2.1)
depends=(
  dconf
  lib32-glib2
)
makedepends=(
  bash-completion
  docbook-xsl
  git
  intltool
  meson
  python
  vala
)
_tag=4c0a26052efafae923eba42d14c5cb88da745de2
source=(git+https://gitlab.gnome.org/GNOME/dconf.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd dconf

  git describe --tags
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson dconf build \
    --libdir=/usr/lib32
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}

# vim: ts=2 sw=2 et:
