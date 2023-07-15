# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-nextencounter-mappack
pkginstdir=serioussamse
pkgver=1.0
_srcname="NE_AncientRome"
pkgrel=2
pkgdesc="Serious Sam Classic Ancient Rome Next Encounter MapPack."
arch=('i686' 'x86_64')
url="https://archive.org/details/ne-ancient-rome"
license=('GPL2')
 
if pacman -Qq serioussam >/dev/null 2>&1; then
  depends=('sdl2' 'python' 'bash' 'serioussam')
elif pacman -Qq serioussam-vk >/dev/null 2>&1; then
  depends=('sdl2' 'python' 'bash' 'serioussam-vk')
else
  echo "This package requires either "serioussam" or "serioussam-vk", but neither is installed."
  echo "Compilation aborted."
  return 1
fi

source=("https://archive.org/download/ne-ancient-rome/NE_AncientRome.gro")
noextract=("NE_AncientRome.gro")
sha256sums=('7bef20e2dab41df0a3c8dcc54c9966834ffd1366a88ab4eea34936ca29602502')

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the Ancient Rome Next Encounter MapPack.
  mkdir -p "$srcdir/$_srcname" || return 0
  cat NE_AncientRome.gro > "$srcdir/$_srcname/NE_AncientRome.gro"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/serioussamse

  # Install data.
  mv "$srcdir/$_srcname/NE_AncientRome.gro" "$pkgdir/usr/share/$pkginstdir/"
}
