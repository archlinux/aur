pkgname=univga
pkgver=1.0
pkgrel=1
pkgdesc="Unicode VGA font"
arch=('any')
url="http://www.inp.nsk.su/~bolkhov/files/fonts/univga/"
license=('MIT')
groups=()
depends=()
makedepends=('xorg-font-utils')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=univga.install
changelog=
source=('http://www.inp.nsk.su/~bolkhov/files/fonts/univga/uni-vga.tgz'
        'http://ftp.de.debian.org/debian/pool/main/c/console-setup/bdf2psf_1.63_all.deb')
noextract=()
md5sums=('60fbba53cb0efec1363fcc5fb8c244d9'
         '83cfa34b14b8b280c9026ee304277d1c')

build() {
  cd "$srcdir"
  bsdtar -xf bdf2psf_1.63_all.deb data.tar.gz
  tar -xzf data.tar.gz

  bdftopcf -o uni_vga/u_vga16.pcf uni_vga/u_vga16.bdf

  usr/bin/bdf2psf --fb uni_vga/u_vga16.bdf \
    usr/share/bdf2psf/standard.equivalents \
    usr/share/bdf2psf/required.set+usr/share/bdf2psf/useful.set \
    512 \
    uni_vga/u_vga16.psf
}

package() {
  cd "$srcdir"/uni_vga

  install -m 644 -D u_vga16.pcf \
    "$pkgdir"/usr/share/fonts/local/u_vga16.pcf

  install -m 644 -D u_vga16.psf \
    "$pkgdir"/usr/share/kbd/consolefonts/u_vga16.psf
}

# vim:set ts=2 sw=2 et:
