# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>

pkgname=wagic-git
pkgver=$(curl https://github.com/WagicProject/wagic/releases | grep "<relative-time datetime=" | head -n 1 | sed 's/>/\n/g' | head -n 1 | sed -e 's/"/\n/g' -e 's/:/\n/g' -e 's/T/\n/g' | head -n 2 | tail -n 1 | sed 's/-//g')
pkgrel=1
pkgdesc='Wagic, the Homebrew, is a C++ game engine that allows to play card games against an AI, specificaly Magic the Gathering.'
url='https://github.com/WagicProject/wagic'
arch=('i686' 'x86_64')
license=('GPL V2')
makedepends=('git')
source=("Wagic-linux-QT.zip::https://github.com/WagicProject/wagic/releases/download/latest-master/Wagic-linux-QT.zip"
"icon.png::https://raw.githubusercontent.com/WagicProject/wagic/master/projects/mtg/Android/res/drawable-ldpi/icon.png")
sha256sums=('SKIP'
'853cf393f13146b61f23d7e93aebe634c7740f4707ff3cd03a17959f3c3f8ca9')
depends=('qt5-tools')

prepare(){
  echo "[Desktop Entry]
Name=Wagic
GenericName=Wagic, the Homebrew
Comment=Wagic, the Homebrew, is a C++ game engine that allows to play card games against an AI, specificaly Magic the Gathering.
Exec=wagic
Icon=/usr/share/icons/wagic.png
Terminal=false
Type=Application
Categories=Game;" > "$srcdir/wagic.desktop"
}


package() {
  cd "$pkgdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -d "$pkgdir/usr/share/icons"
  install -m755 -d "$pkgdir/usr/share/applications/"

  cp -r "$srcdir/wagic" "$pkgdir/usr/bin/"
  cp -r "$srcdir/icon.png" "$pkgdir/usr/share/icons/wagic.png"
  cp -r "$srcdir/wagic.desktop" "$pkgdir/usr/share/applications/wagic.desktop"
  msg ""
  msg ""
  msg ""
  msg "If you want card icons, copy the image sets over to ~/.Wagic/sets/"
  msg ""
  msg ""
  msg ""
}
