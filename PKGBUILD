# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Dominion <xGenoBlast@gmail.com>
pkgname=powder
pkgver=118
pkgrel=1
pkgdesc='A graphical roguelike, originally designed for the Game Boy Advance'
url='http://www.zincland.com/powder/'
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl')
source=("$pkgname-$pkgver.tar.gz::http://zincland.com/powder/release/${pkgname}${pkgver}_src.tar.gz")
sha256sums=('4e812f3972c7dd1ff2403557d1cd891a98470f59ccf09bc03ce79dafd118f3d7')

build() {
export CXXFLAGS='-O3 -Wno-narrowing'
  cd "${srcdir}/${pkgname}${pkgver}_src/"
  ./buildall.sh --use-home-dir
  echo "[Desktop Entry]
Name=Powder
GenericName=Powder
Comment=POWDER is a roguelike originaly developed specifically for the Gameboy Advance (GBA).
Exec=powder
Icon=/usr/share/icons/powder.bmp
Terminal=false
Type=Application
Categories=Game;" > "$srcdir/powder.desktop"

}

package() {
  cd "${srcdir}/${pkgname}${pkgver}_src/"
  install -Dm755 powder "${pkgdir}/usr/bin/powder"
  install -Dm755 ./gfx/icon_sdl.bmp "${pkgdir}/usr/share/icons/powder.bmp"
  install -Dm755 "$srcdir/powder.desktop" $pkgdir/usr/share/applications/powder.desktop


  # Add LICENSE
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/powder/LICENSE"
}
