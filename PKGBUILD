# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-brightisland-mappack
pkginstdir=serioussamse
pkgver=1.1
_srcname="CECIL_BrightIsland"
pkgrel=1
pkgdesc="Serious Sam Classic Bright Island MapPack."
arch=('i686' 'x86_64')
url="https://archive.org/details/cecil-bright-island-1.1"
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

source=("https://archive.org/download/cecil-bright-island-1.1/CECIL_BrightIsland_1.1.gro")
noextract=("CECIL_BrightIsland_1.1.gro")
sha256sums=('c1608ff95c50d878f7d83894c327b9b9b2302f4cca6c0f9750327bb4ede0ee87')

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the Bright Island MapPack.
  mkdir -p "$srcdir/$_srcname" || return 0
  cat CECIL_BrightIsland_1.1.gro > "$srcdir/$_srcname/CECIL_BrightIsland_1.1.gro"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/serioussamse

  # Install data.
  mv "$srcdir/$_srcname/CECIL_BrightIsland_1.1.gro" "$pkgdir/usr/share/$pkginstdir/"
}
