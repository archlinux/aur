# Maintainer: none
# Contributor: Lamelos <lamelos@gmail.com>
pkgname=gulden-bin
pkgver=1.6.4.2
_version=1.6.4
pkgrel=1
pkgdesc="Gulden Cryptocurrency (binaries)"
arch=('i686' 'x86_64')
url="https://www.gulden.com/"
license=('GPL')
depends=('fontconfig'
         'hicolor-icon-theme'
         'desktop-file-utils')
PKGEXT='.pkg.tar'

md5sums=('05989a69fceaabd32dfa3798f6f79f95')
if [ "$CARCH" == "i686" ]; then
    md5sums=('2f0fe9204ea8c47598ff0a4787bbf178')
fi
_SRC_FILENAME="Gulden-$_version-$CARCH-linux.tar.gz"
_SRC_URI="https://github.com/Gulden/gulden-official/releases/download/v$pkgver/${_SRC_FILENAME}"

_ICON_SRC_NAME="gwhite"  # or gblue also available
_ICON_SRC_URI="https://developer.gulden.com/images/branding/${_ICON_SRC_NAME}"
_ICON_SRC_EXT=".png"

source=("${_SRC_URI}"
        "$pkgname.desktop")

for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
  source+=("${_ICON_SRC_URI}$i${_ICON_SRC_EXT}")
done

md5sums+=('60ad8c84fd4112a793a68f2c487617cc'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package ()
{
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/$pkgname/lib
  cp -Ra "$srcdir"/"$_dirname"/lib "$pkgdir"/usr/share/"$pkgname"/
  cp -a "$srcdir"/"$_dirname"/{Gulden,Gulden-cli,Gulden-tx,GuldenD} "$pkgdir"/usr/share/"$pkgname"/
  cp -a "$srcdir"/"$_dirname"/qt.conf "$pkgdir"/usr/share/"$pkgname"/

  for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 ${_ICON_SRC_NAME}$i${_ICON_SRC_EXT} "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname${_ICON_SRC_EXT}"
  done
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
