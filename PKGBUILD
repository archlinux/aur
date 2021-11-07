# Maintainer: Megameneer (Dennis Holierhoek) <dennis.hh@hotmail.com>
# Maintainer: fshp (Maxim Moseychuk) <franchesko.salias.hudro.pedros@gmail.com>
# Maintainer: maxlefou <buttbadger@gmail.com>
pkgname=gimp-dds
pkgver=3.0.1
pkgrel=6
pkgdesc="A plugin for the GIMP version 2.8. It allows you to load and save images in the Direct Draw Surface (DDS) format"
arch=('any')
url=https://code.google.com/archive/p/gimp-dds
license=('GPL2')
depends=('gimp>=2.8.x' 'glib2' 'gtk2' 'pango' 'atk')
makedepends=('pkg-config')
source=(
  https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gimp-dds/gimp-dds-3.0.1.tar.bz2
  non_square_mipmaps.patch)
sha256sums=(
  '6e53df3b8b98c55f22fa7ea2c3ed17478626c924b24c69d499f5d813c3c2788a'
  '6963e30890e668a8bd75b7d8fcff9ba160eb7306c3760459b706ff119b76bbe0')

prepare() {
  cd "$srcdir"/gimp-dds-$pkgver

  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=731486
  patch -p1 -i ../non_square_mipmaps.patch
}

build() {
  cd "$srcdir"/gimp-dds-$pkgver

  make
}

package() {
  cd "$srcdir"/gimp-dds-"$pkgver"
  install -dm755 "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
  cp dds "$pkgdir"/usr/lib/gimp/2.0/plug-ins
  chmod 755 "$pkgdir"/usr/lib/gimp/2.0/plug-ins/dds
}
