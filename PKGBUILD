# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-dconf
pkgver=0.30.1
pkgrel=1
pkgdesc='A low-level configuration system'
arch=('x86_64')
url='https://live.gnome.org/dconf'
license=('LGPL2.1')
depends=('dconf' 'lib32-glib2')
makedepends=(
  'bash-completion' 'docbook-xsl' 'gcc-multilib' 'git' 'intltool' 'meson'
  'python' 'vala'
)
source=("git+https://gitlab.gnome.org/GNOME/dconf.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson dconf build \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/dconf' \
    -Denable-man=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
