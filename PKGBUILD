# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: Greg Greenaae <ggreenaae@gmail.com>

pkgname=beersmith2
pkgver=2.3.12
_series=${pkgver%.*} _minor=${_series##*.} _major=${_series%%.*}
pkgrel=4
pkgdesc='Complete software suite for brewers'
arch=('x86_64')
url='https://beersmith.com'
license=('commercial')
source_x86_64=("https://s3.amazonaws.com/beersmith$_major-$_minor/BeerSmith-${pkgver}_amd64.deb")
sha256sums_x86_64=('2b67b7c232e2b0a9a6e08826c33ea0e0c02772b0ffa542bbdeb8fa7d9706f5e1')

package() {
  depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
           'libsm' 'libx11' 'libxxf86vm' 'libpng12' 'pango' 'webkit2gtk' 'zlib')

  bsdtar -xf data.tar.xz -C "$pkgdir"

  rm -r "$pkgdir"{/etc/,/usr/share/menu/}
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr "$pkgdir/usr/share/BeerSmith$_major/license.rtf" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
