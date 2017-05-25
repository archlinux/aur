# Maintainer : Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>
# Contributor: Mael Clerambault <mael@clerambault.fr>
# Contributor: Forgeot Eric <http://ifiction.free.fr>

# This PKGBUILD is based on work of previous contributors.
# It is only a tiles version.

pkgname=stone-soup-tiles
_pkgname=stone_soup
pkgver=0.20.0
_pkgver=0.20
pkgrel=1
pkgdesc="Community maintained variant of Linley's Dungeon Crawl (tiles version)"
arch=('i686' 'x86_64')
url="http://crawl.develz.org"
depends=(lua libpng libx11 ncurses sdl2_image)
makedepends=(pngcrush)
license=('GPL2')
conflicts=('crawl')
source=(http://crawl.develz.org/release/$_pkgver/stone_soup-$pkgver.tar.xz stone-soup-tiles.desktop)
sha1sums=('8eb0e16aa68db2d0c8ec347c5542808bad22243c'
          '48cfc0656309746abe389d13fc8d32f8cd75faaa')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/source/"
  make prefix="${pkgdir}/usr" TILES=y SAVEDIR='~/.stone-soup'
}

package() {

  cd "${srcdir}/${_pkgname}-${pkgver}/source/"
  make install prefix="${pkgdir}/usr" TILES=y SAVEDIR='~/.stone-soup'
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp ${srcdir}/${_pkgname}-${pkgver}/source/dat/tiles/stone_soup_icon-32x32.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
}

