# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=univga
pkgver=1.0
pkgrel=9
pkgdesc="(X11) VGA font with unicode glyphs by Dmitry Yu. Bolkhovityanov"
arch=('any')
url="http://www.inp.nsk.su/~bolkhov/files/fonts/univga/"
license=('custom:MIT')
makedepends=('python3')
depends=('fontconfig')
source=('http://www.inp.nsk.su/~bolkhov/files/fonts/univga/uni-vga.tgz'
        'https://downloads.sourceforge.net/project/terminus-font/terminus-font-4.49/terminus-font-4.49.1.tar.gz'
        COPYING)
md5sums=('60fbba53cb0efec1363fcc5fb8c244d9'
         '1b6acbd221957e33c8a792ebfaf3a659'
         'd7a18e3868102a377d2b8ce92637826b')

build() {
  cd "$srcdir"/uni_vga

  # Sadly, converting from BDF to OTB is not trivial and Terminus
  # provides the only working converter that I know of. fontforge and
  # fonttosfnt produce wrong results (too high, too wide). If you know
  # of a better way, let me know.
  python3 "$srcdir"/terminus-font-4.49.1/bin/otb1cli.py \
    -o u_vga16.otb u_vga16.bdf
}

package() {
  cd "$srcdir"/uni_vga

  install -m 644 -D u_vga16.otb \
    "$pkgdir"/usr/share/fonts/local/u_vga16.otb

  install -m 644 -D "$srcdir"/COPYING \
    "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}

# vim:set ts=2 sw=2 et:
