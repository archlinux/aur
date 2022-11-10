# Contributor: Doug Newgard <scimmia at archlinux dot org>

pkgname=beersmith
pkgver=3.2.8
pkgrel=1
pkgdesc='Complete software suite for brewers'
arch=('x86_64')
url='https://beersmith.com'
license=('commercial')
servsuffix=${pkgver/./-}
servsuffix=${servsuffix%%.*}
source_x86_64=("https://beersmith${servsuffix}.s3.amazonaws.com/BeerSmith-${pkgver}_amd64.deb")
sha256sums_x86_64=('a8dfc610e2532b179057dfd775e3db00515c811160b08b52d5ad6e8ce680fb1b')

package() {
  depends=('cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
           'libpng' 'libsm' 'libx11' 'libxxf86vm' 'openssl' 'pango' 'webkit2gtk' 'zlib')

  bsdtar -xf data.tar.zst -C "$pkgdir"

  rm -r "$pkgdir"{/etc/,/usr/share/menu/}
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr "$pkgdir/usr/share/BeerSmith${pkgver%%.*}/license.rtf" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
