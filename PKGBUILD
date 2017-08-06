# Contributor: MCMic <come.bernigaud@laposte.net>
# Contributor: Cravix (AUR)
# Maintainer: SanskritFritz

pkgname=meandmyshadow
pkgver=0.4.1
pkgrel=3
pkgdesc="Puzzle/platform game in which you try to reach the exit by solving puzzles."
arch=('i686' 'x86_64')
url="http://meandmyshadow.sourceforge.net/"
license=('GPL3')
depends=('sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'curl' 'libarchive' 'hicolor-icon-theme' 'libgl')
makedepends=('make' 'cmake')
install="${pkgname}.install"
source=("https://sourceforge.net/projects/meandmyshadow/files/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
        XFree.patch)
md5sums=('724cb4a1822572dbe04131b5db658d19'
         '571408e6efdf82358570e9f89db115e4')

prepare() {
  cd "$pkgname-$pkgver"
  patch --binary < "$startdir/XFree.patch"
}

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR=${pkgdir}
}

