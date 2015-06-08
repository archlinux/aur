# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Sphax <zecmerquise.at.gmail.dot.com>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>

pkgname=psx
pkgver=1.13
pkgrel=9
pkgdesc="A PlayStation emulator, not plugin based"
arch=('i686' 'x86_64')
url="http://psxemulator.gazaxian.com/"
license=('unknown')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-gtkglext' 'lib32-alsa-lib' 'lib32-libglade' 'lib32-xcb-util' 'lib32-libpng14' 'lib32-pangox-compat')
  optdepends=('lib32-gtk-engines: libclearlooks.so library'
              'lib32-bug-buddy: libgnomesegvhandler.so library'
              'lib32-alsa-plugins: for PulseAudio users')
else
  depends=('gtkglext' 'alsa-lib' 'libglade' 'xcb-util' 'libpng14' 'pangox-compat')
fi
install="psx.install"
source=("http://trya.alwaysdata.net/linux/pSX_linux_1_13.tar.bz2"
        "http://trya.alwaysdata.net/linux/icons/psx.png"
        'psx.sh' 'psx.desktop' 'psx.ini')
md5sums=('0812408db22184ceb8cb29ae7601298f'
         '6471243708d085addec13e947d71d853'
         '263960da5c0ee779700f235512de4200'
         '3b93679970229887294aee79fef1924e'
         '5ad67ab8608edde9545571a9e8bc19e9')
options=(!strip)

package() {
  cd "$srcdir"

  # default configuration and documentation
  install -d "$pkgdir/usr/share/pSX"/{bios,cdimages}
  install -Dm644 psx.ini "$pkgdir/usr/share/pSX/psx.ini"
  install -Dm644 pSX/readme.txt "$pkgdir/usr/share/doc/pSX/readme.txt"

  # startup script and executable
  install -Dm755 psx.sh "$pkgdir/usr/bin/pSX"
  install -Dm755 pSX/pSX "$pkgdir/usr/lib/pSX/pSX"

  # desktop icon
  install -Dm644 psx.desktop "$pkgdir/usr/share/applications/psx.desktop"
  install -Dm644 psx.png "$pkgdir/usr/share/pixmaps/psx.png"
}
