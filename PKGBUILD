# Mentioner: Orche <orkv1234@gmail.com>
# Contributor: Eli Štefků "Octelly" <eli@stefek.cz>

pkgname=heaven-studio-nightly-bin
provides=("heaven-studio")
_pkgname=heaven-studio
pkgver=6241434638
# note: Couldn't find a proper versioning system for this project
pkgrel=7
pkgdesc="Fully playable, open source recreation of every Rhythm Heaven minigame with a built in level editor."
arch=('x86_64')
url="https://github.com/RHeavenStudio/HeavenStudio"
license=('GPL3')
source=(
  "https://archive.org/download/hs-nightly-140624/StandaloneLinux64-build.zip"
	'heaven-studio.desktop'
)
noextract=("StandaloneLinux64-build.zip")
sha512sums=(
	'SKIP'
	'SKIP'
)
makedepends=('unzip' 'tar')

prepare() {
 unzip StandaloneLinux64-build.zip
 rm StandaloneLinux64-build.zip
 tar -xvf StandaloneLinux64.tar
 rm StandaloneLinux64.tar
}

package() {
  cd build/StandaloneLinux64
  find . -type f -exec install -v -Dm 755 "{}" "$pkgdir/opt/$_pkgname/{}" \;

  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  ln -sf /opt/heaven-studio/Heaven\ Studio_Data/Resources/UnityPlayer.png $pkgdir/usr/share/icons/hicolor/128x128/apps/heaven-studio.png

  mkdir -p $pkgdir/usr/share/applications
  cd ../..
  install -Dm 755 "heaven-studio.desktop" $pkgdir/usr/share/applications
}
