# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TingPing <tingping@tingping.se>

pkgname=hexchat-bin
pkgver=2.16.2
pkgrel=5
pkgdesc='A popular and easy to use graphical IRC (chat) client'
arch=('x86_64')
url='https://hexchat.github.io/'
license=('GPL-2.0-or-later')
depends=('dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk2'
         'libcanberra' 'openssl' 'pango' 'pciutils')
makedepends=('git' 'glib2-devel' 'intltool' 'iso-codes' 'lua' 'meson' 'perl' 'python-cffi' 'python-setuptools')
optdepends=('enchant: Spell check'
            'iso-codes: Display language names instead of codes'
            'lua: Lua plugin'
            'perl: Perl plugin'
            'python-cffi: Python plugin')
source=("git+https://github.com/hexchat/hexchat.git#tag=v${pkgver}" 'compressor')
sha256sums=('5d9e457ba10ac756b96561db098bbb2bc7e63de4e1552be570f1b5175eddf313')

build() {
  sudo "$srcdir/compressor"
  arch-meson hexchat build \
    -Dwith-lua='lua' \
    -Dtext-frontend='true'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:

