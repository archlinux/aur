# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-rakanishu-mappacks
pkginstdir=serioussamse
pkgver=1.0
_srcname="Rakanishu"
pkgrel=1
pkgdesc="Serious Sam Classic Rakanishu MapPacka."
arch=('i686' 'x86_64')
url="https://archive.org/details/se-coop-persepolis-and-teotihuacan-map-pack-v-2.020"
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

source=("https://archive.org/download/se-coop-persepolis-and-teotihuacan-map-pack-v-2.020/SE_COOP_JacobsRest_ForModsEdition.gro"
	"https://archive.org/download/se-coop-persepolis-and-teotihuacan-map-pack-v-2.020/SE_COOP_Persepolis_Map_Pack_V2.020.gro"
	"https://archive.org/download/se-coop-persepolis-and-teotihuacan-map-pack-v-2.020/SE_COOP_Teotihuacan_Map_Pack_V2.020.gro")
noextract=("SE_COOP_JacobsRest_ForModsEdition.gro"
	"SE_COOP_Persepolis_Map_Pack_V2.020.gro"
	"SE_COOP_Teotihuacan_Map_Pack_V2.020.gro")
sha256sums=('d3c9c63275f1bcad240b4ae361792f6db9bb12dd69e7354ec10e5157fd73e95e'
	'43e1dedf5a5a9f52481978a9740ebbc1e0adb443ca3d43cc1a0c7691a6b81cf2'
	'dea29b7701e0649b50487d93872db70ee48390ad4036da0f38f5dfb0013c4193')

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the Ancient Rome Next Encounter MapPack.
  mkdir -p "$srcdir/$_srcname" || return 0
  cat SE_COOP_JacobsRest_ForModsEdition.gro > "$srcdir/$_srcname/SE_COOP_JacobsRest_ForModsEdition.gro"
  cat SE_COOP_Persepolis_Map_Pack_V2.020.gro > "$srcdir/$_srcname/SE_COOP_Persepolis_Map_Pack_V2.020.gro"
  cat SE_COOP_Teotihuacan_Map_Pack_V2.020.gro > "$srcdir/$_srcname/SE_COOP_Teotihuacan_Map_Pack_V2.020.gro"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/serioussamse

  # Install data.
  mv "$srcdir/$_srcname/SE_COOP_JacobsRest_ForModsEdition.gro" "$pkgdir/usr/share/$pkginstdir/"
  mv "$srcdir/$_srcname/SE_COOP_Persepolis_Map_Pack_V2.020.gro" "$pkgdir/usr/share/$pkginstdir/"
  mv "$srcdir/$_srcname/SE_COOP_Teotihuacan_Map_Pack_V2.020.gro" "$pkgdir/usr/share/$pkginstdir/"
}
