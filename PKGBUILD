# Maintainer: Yonaton Chriqui <yonaton.chriqui@gmail.com>

pkgname=heaven-studio-bin
_pkgname=heaven-studio
provides=("heaven-studio")
pkgver=1.0.1
pkgrel=1
pkgdesc="Fully playable, open source recreation of every Rhythm Heaven minigame with a built in level editor."
arch=('x86_64')
url="https://github.com/RHeavenStudio/HeavenStudio"
license=('GPL3')
source=(
	"https://github.com/RHeavenStudio/HeavenStudio/releases/download/v${pkgver}/HeavenStudio_Linux_${pkgver//./}.zip"
	'heaven-studio.desktop'
)
noextract=("HeavenStudio_Linux_101.zip")
sha512sums=(
	'SKIP'
	'SKIP'
)
makedepends=('unzip' 'tar')
conflicts=('heaven-studio-nightly-bin')

prepare() {
 unzip HeavenStudio_Linux_101.zip
 rm HeavenStudio_Linux_101.zip
 tar -xvf StandaloneLinux64.tar
 rm StandaloneLinux64.tar
}

package() {
  cd build/StandaloneLinux64
  find . -type f -exec install -v -Dm 755 "{}" "$pkgdir/opt/$_pkgname/{}" \;

  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  ln -sf /opt/$_pkgname/Heaven\ Studio_Data/Resources/UnityPlayer.png $pkgdir/usr/share/icons/hicolor/128x128/apps/heaven-studio.png

  mkdir -p $pkgdir/usr/share/applications
  cd ../..
  install -Dm 755 "heaven-studio.desktop" $pkgdir/usr/share/applications
}
