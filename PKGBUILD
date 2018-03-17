# $Id$
# Maintainer: Soni L. <fakedme+aur@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TingPing <tingping@tingping.se>

pkgname=hexchat-purelua
pkgver=2.14.1
pkgrel=2
pkgdesc='A popular and easy to use graphical IRC (chat) client (build for ppl who need a sandboxable Lua VM and have been using Lua 5.3 scripts since the plugin came out)'
arch=('x86_64')
url='https://hexchat.github.io/'
license=('GPL')
provides=('hexchat')
conflicts=('hexchat')
depends=('dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'libcanberra' 'libnotify' 'libproxy' 'openssl' 'pango' 'pciutils')
makedepends=('intltool' 'iso-codes' 'lua' 'meson' 'perl' 'python')
optdepends=('enchant: Spell check'
            'iso-codes: Display language names instead of codes'
            'lua: Lua plugin'
            'perl: Perl plugin'
            'python: Python plugin')
source=("https://dl.hexchat.net/hexchat/hexchat-${pkgver}.tar.xz"{,.asc})
sha256sums=('b032e4bcebe2229f87047439979a1246ddcbf599e7e538baa3f2abfac9a003a2'
            'SKIP')
validpgpkeys=('108BF2212A051F4A72B18448B3C7CE210DE76DFC') # Patrick Griffis

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../hexchat-${pkgver} \
    -Dwith-text='true' -Dwith-lua='lua'
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
