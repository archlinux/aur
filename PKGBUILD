# Maintainer: none
# Contributor: Lamelos <lamelos@gmail.com>
pkgname=gulden-bin
pkgver=1.5.5
_version=155
pkgrel=2
pkgdesc="Gulden Cryptocurrency (binaries)"
arch=('i686' 'x86_64')
url="https://www.gulden.com/"
license=('GPL')
depends=('fontconfig'
         'hicolor-icon-theme')
PKGEXT='.pkg.tar'

_dirname="Gulden-$pkgver"

_pkgarch="64"
md5sums=('f8207bf8ce855a1fb98a8c59daec169d')
if [ "$CARCH" == "i686" ]; then
    _pkgarch="32"
    md5sums=('2f0fe9204ea8c47598ff0a4787bbf178')
fi
_SRC_FILENAME="Gulden$_version-linux$_pkgarch.tar.gz"
_SRC_URI="https://developer.gulden.com/download/$_version/${_SRC_FILENAME}"

_ICON_SRC_NAME="gwhite"  # or gblue also available
_ICON_SRC_URI="https://developer.gulden.com/images/branding/${_ICON_SRC_NAME}"
_ICON_SRC_EXT=".png"

source=("${_SRC_URI}"
        "$pkgname.desktop")

for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
  source+=("${_ICON_SRC_URI}$i${_ICON_SRC_EXT}")
done

md5sums+=('d2cc8941bfa9b38e6920555b7c151947'
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
  install -d "$pkgdir"/usr/{bin,include,lib}
  cp -Ra "$srcdir"/"$_dirname"/{bin,include,lib} "$pkgdir"/usr/

  for i in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 ${_ICON_SRC_NAME}$i${_ICON_SRC_EXT} "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname${_ICON_SRC_EXT}"
  done
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
