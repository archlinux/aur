# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
pkgname=playbox
pkgrel=1
pkgver=1.8.0
pkgdesc="A growing collection of board games."
arch=('x86_64')
url="http://sourceforge.net/projects/playbox/"
license=('GPLv3')
depends=('gtk3')
makedepends=('unzip')

build() {

  msg "Grabbing files...."
  curl https://iweb.dl.sourceforge.net/project/playbox/playboxfx-8.0.0-linux-portable.zip -L -o playbox.zip
  unzip playbox.zip

}

package() {
  cd "$pkgdir"
  install -m777 -d "$pkgdir/opt/playbox-portable"
  cp -r "$srcdir/playbox-portable" "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  echo "[Desktop Entry]
Name=Playbox
GenericName=Playbox
Comment=A growing collection of board games.
Exec=/opt/playbox-portable/playbox -configuration ~/.config/playbox/
Icon=/opt/playbox-portable/icon.xpm
Terminal=false
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/playbox.desktop"
  echo "#!/bin/sh
/opt/playbox-portable/playbox -configuration ~/.config/playbox/" > "$pkgdir/usr/bin/playbox"
  chmod +x "$pkgdir/usr/bin/playbox"
}

