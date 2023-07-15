# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-brightisland-mappack
pkginstdir=serioussamse
pkgver=1.0
_srcname="CECIL_BrightIsland"
pkgrel=1
pkgdesc="Serious Sam Classic Bright Island MapPack."
arch=('i686' 'x86_64')
url="https://archive.org/details/cecil-bright-island"
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

source=("https://archive.org/download/cecil-bright-island/CECIL_BrightIsland.gro")
noextract=("CECIL_BrightIsland.gro")
sha256sums=('af4b0ffd14b8a20d52911dbb94ea778845e5fd6f25d91fe6f58b1e58084c15fa')

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the Bright Island MapPack.
  mkdir -p "$srcdir/$_srcname" || return 0
  cat CECIL_BrightIsland.gro > "$srcdir/$_srcname/CECIL_BrightIsland.gro"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/serioussamse

  # Install data.
  mv "$srcdir/$_srcname/CECIL_BrightIsland.gro" "$pkgdir/usr/share/$pkginstdir/"
}
