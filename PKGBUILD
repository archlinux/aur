# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

pkgname=odamex
pkgver=0.7.0
pkgrel=2
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl_mixer>=1.2.6' 'wxgtk')
makedepends=('cmake')
optdepends=('timidity++: Required for music')
source=("http://downloads.sourceforge.net/odamex/odamex-src-${pkgver}.tar.bz2"
        0001-Fix-WAD-path.patch)
md5sums=('312769b98bbdb450454e4676b2c55986'
         'bb32f96f8b78f71456ae758b48e3fbe1')

build() {
	cd odamex-src-${pkgver}
  
  patch -p1 -i $srcdir/0001-Fix-WAD-path.patch

  cmake .
  make
}

package() {
	cd odamex-src-${pkgver}

  install -Dm755 client/odamex "$pkgdir/usr/bin/odamex"
  install -Dm755 server/odasrv "$pkgdir/usr/bin/odasrv"
  install -Dm755 odalaunch/odalaunch "$pkgdir/usr/bin/odalaunch"
  install -Dm644 odamex.wad "$pkgdir/usr/share/odamex/odamex.wad"
  install -Dm644 media/icon_odamex_96.png "$pkgdir/usr/share/pixmaps/odamex.png"
  install -Dm644 media/icon_odasrv_96.png "$pkgdir/usr/share/pixmaps/odasrv.png"
  install -Dm644 media/icon_odalaunch_96.png "$pkgdir/usr/share/pixmaps/odalaunch.png"
  install -Dm644 installer/arch/odamex.desktop "$pkgdir/usr/share/applications/odamex.desktop"
  install -Dm644 installer/arch/odasrv.desktop "$pkgdir/usr/share/applications/odasrv.desktop"
  install -Dm644 installer/arch/odalaunch.desktop "$pkgdir/usr/share/applications/odalaunch.desktop"
}

# vim:set ts=2 sw=2 et:
