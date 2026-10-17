# Maintainer: Michaël Cadilhac <michael at cadilhac dot name>
# Contributor: Doug Newgard <scimmia at archlinux dot org>

pkgname=beersmith3
pkgver=3.2.8
pkgrel=1
pkgdesc='Complete software suite for brewers (legacy version 3)'
arch=('x86_64')
url='https://beersmith.com'
license=('LicenseRef-scancode-commercial-license')
depends=('brotli' 'cairo' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme'
         'libgcc' 'libjpeg-turbo' 'libnghttp2' 'libpng' 'libpsl' 'libsm'
         'libstdc++' 'libtiff' 'libx11' 'libxkbcommon' 'openssl' 'pango'
         'webkit2gtk-4.1' 'zlib' 'zstd')
# BeerSmith 4 uses separate executable, desktop entry, icons and data directories.
conflicts=('beersmith<4')
# Same upstream version as the last beersmith 3 package, rebuilt for current libraries.
source_x86_64=("https://beersmith3-2.s3.amazonaws.com/BeerSmith-${pkgver}_24_04_amd64.deb")
sha256sums_x86_64=('209f72df899f300295769f0f4575f8d88ca72915b7eeca8d6f79400b920f418d')
# Preserve the vendor executable; do not create an empty debug package.
options=('!strip' '!debug' '!emptydirs')

package() {
  bsdtar --no-same-owner -xf data.tar.zst -C "$pkgdir"

  rm -r "$pkgdir/etc" "$pkgdir/usr/share/menu"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../BeerSmith3/license.rtf "$pkgdir/usr/share/licenses/$pkgname/license.rtf"
}
