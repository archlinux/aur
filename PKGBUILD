# Contributor: Doug Newgard <scimmia at archlinux dot org>

pkgname=beersmith
pkgver=3.2.7
pkgrel=1
pkgdesc='Complete software suite for brewers'
arch=('x86_64')
url='https://beersmith.com'
license=('commercial')
servsuffix=${pkgver/./-}
servsuffix=${servsuffix%%.*}
source_x86_64=("https://beersmith${servsuffix}.s3.amazonaws.com/BeerSmith-${pkgver}_amd64.deb")
sha256sums_x86_64=('0ba64dd7cad373b9bd349394c5909e4d2693e7d66b9456cee6d95c7741d540f3')

package() {
  depends=('cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
           'libpng' 'libsm' 'libx11' 'libxxf86vm' 'openssl' 'pango' 'webkit2gtk' 'zlib')

  bsdtar -xf data.tar.xz -C "$pkgdir"

  rm -r "$pkgdir"{/etc/,/usr/share/menu/}
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr "$pkgdir/usr/share/BeerSmith${pkgver%%.*}/license.rtf" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
