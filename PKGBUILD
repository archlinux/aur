# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>

pkgname=wagic-git
pkgver=0.22.2
pkgrel=1
pkgdesc='Wagic, the Homebrew, is a C++ game engine that allows to play card games against an AI, specificaly Magic the Gathering.'
url='https://github.com/WagicProject/wagic'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git')
depends=('qt5-tools')


build() {

  msg "Grabbing files...."
	curl -L https://github.com/WagicProject/wagic/releases/download/wagic-v0.22.2/WagicLinux-0222.zip -o wagic.zip
	curl https://raw.githubusercontent.com/WagicProject/wagic/master/projects/mtg/Android/res/drawable-ldpi/icon.png -o icon.png
	unzip wagic.zip

}
package() {
  cd "$pkgdir"
  install -m777 -d "$pkgdir/opt/Wagic"
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -d "$pkgdir/usr/share/icons"
  install -m755 -d "$pkgdir/usr/share/applications/"
  
  cp -r "$srcdir/Wagic" "$pkgdir/opt/"
  cp -r -L "$srcdir/icon.png" "$pkgdir/usr/share/icons/wagic.png"

  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  echo "[Desktop Entry]
Name=Wagic
GenericName=Wagic, the Homebrew
Comment=Wagic, the Homebrew, is a C++ game engine that allows to play card games against an AI, specificaly Magic the Gathering.
Exec=/opt/Wagic/Wagic_X11
Icon=/usr/share/icons/wagic.png
Terminal=false
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/wagic.desktop"
	echo "#!/bin/sh
/opt/Wagic/Wagic_X11" > "$pkgdir/usr/bin/wagic"
  chmod +x "$pkgdir/usr/bin/wagic"
  chmod +x "$pkgdir/opt/Wagic/Wagic"
  chmod +x "$pkgdir/opt/Wagic/Wagic_X11"
  
  msg ""
  msg ""
  msg ""
  msg "If you want card icons, copy the image sets over to ~/.Wagic/sets/"
  msg ""
  msg ""
  msg ""
}
