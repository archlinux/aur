# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=zeronoise
pkgver=1.04.4
pkgrel=1
pkgdesc='HDR, get tiff from several shots without noise and a lot of dynamic range'
arch=('i686' 'x86_64')
url='http://www.guillermoluijk.com/tutorial/zeronoise/index.htm'
license=('custom:freeware')
groups=()
depends=(hicolor-icon-theme wxgtk gsl libpng12 libtiff)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install='zeronoise.install'
#CARCH=x86_64
case $CARCH in
  i686)
    _CARCH=i386
    md5sums=('9b10507a8432d3056bc70f8d34990e86')
    ;;
  x86_64)
    _CARCH=amd64
    md5sums=('a413a3609a0ed94582856e7b5f7fc58e')
    ;;
esac
source=(https://sites.google.com/site/zeronoiselinux/file-cabinet/$pkgname-${pkgver}_${_CARCH}.deb
zeronoise.desktop
zeronoise_64x64.png
)
noextract=()

package(){
  cd "$srcdir"
  tar zxf data.tar.gz
  install -Dm755 usr/local/bin/zeronoise "$pkgdir"/usr/bin/zeronoise
  install -dm755 "$pkgdir"/usr/share/zeronoise
  install -Dm644 usr/share/zeronoise/default2.png "$pkgdir"/usr/share/zeronoise/
  install -Dm644 usr/share/zeronoise/default.png "$pkgdir"/usr/share/zeronoise/
  install -Dm644 "$srcdir"/zeronoise.desktop "$pkgdir"/usr/share/applications/zeronoise.desktop
  install -Dm644 "$srcdir"/zeronoise_64x64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/zeronoise.png
  # 
  install -dm755 "$pkgdir"/usr/share/licenses/zeronoise

# workaround to missing libtiff.so.4
  install -dm755 "$pkgdir"/usr/lib
  cd "$pkgdir"/usr/lib
  ln -s libtiff.so libtiff.so.4
}
md5sums+=(
         '8244f0d3f656b329ea744f6a4bdc1b57'
         '45396c7b617e1d7cdb65303a24255e7f')
