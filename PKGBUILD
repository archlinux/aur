# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TingPing <tingping@tingping.se>

pkgname=ditrigon
pkgver=1.6.0
pkgrel=1
pkgdesc='A popular and easy to use graphical IRC (chat) client'
arch=('x86_64')
url='https://github.com/bluewww/ditrigon'
license=('GPL-2.0-or-later')
depends=('dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk2-compat'
         'libcanberra' 'openssl' 'pango' 'pciutils')
makedepends=('git' 'glib2-devel' 'intltool' 'iso-codes' 'lua' 'meson' 'perl' 'python-cffi' 'python-setuptools')
optdepends=('enchant: Spell check'
            'iso-codes: Display language names instead of codes'
            'lua: Lua plugin'
            'perl: Perl plugin'
            'python-cffi: Python plugin')
source=("git+https://github.com/bluewww/ditrigon.git#tag=v${pkgver}")
sha256sums=('23da16b15091922e06eb5dc4db9818c8dcd0ee7626b56a18caf49365195f2e83')
options=(!debug)

prepare() {
	cd $srcdir/ditrigon
	sed -i s/1.5.3/$pkgver/ meson.build
}
build() {
  cd "$srcdir/ditrigon"
  meson setup build \
	-Dprefix=/usr
  meson compile -C build
}

package() {
  cd $srcdir/ditrigon
  DESTDIR="${pkgdir}" meson install -C build

}
