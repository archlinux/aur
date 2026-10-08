# Contributor: Doug Newgard <scimmia at archlinux dot org>

pkgname=beersmith
pkgver=4.0.22
pkgrel=1
pkgdesc='Complete software suite for brewers'
arch=('x86_64')
url='https://beersmith.com'
license=('commercial')
servsuffix=${pkgver%%.*}
source_x86_64=("https://beersmith${servsuffix}.s3.amazonaws.com/BeerSmith-${pkgver}_amd64.deb")
sha256sums_x86_64=('f42bcff3c47d37e57dee7ea66bfd1f540096f0bc99e133568cf636c4617881d8')

package() {
  depends=('cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
           'libpng' 'libsm' 'libx11' 'libxxf86vm' 'openssl' 'pango' 'webkit2gtk-4.1' 'zlib')

  bsdtar -xf data.tar.zst -C "$pkgdir"

  rm -r "$pkgdir"{/etc/,/usr/share/menu/}
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr "$pkgdir/usr/share/BeerSmith${pkgver%%.*}/license.rtf" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
