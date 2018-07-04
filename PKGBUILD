# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
pkgname=playbox
pkgrel=1
pkgver=1.6.3
pkgdesc="A growing collection of board games."
arch=('x86_64')
url="http://sourceforge.net/projects/playbox/"
license=('Eclipse Public License')
depends=('gtk3')
makedepends=('unzip')

build() {

  msg "Grabbing files...."
  curl https://excellmedia.dl.sourceforge.net/project/playbox/6/playbox-1.6.3.linux.gtk.x86_64.zip -L -o playbox.zip
  unzip playbox.zip

}

package() {
  cd "$pkgdir"
  install -m777 -d "$pkgdir/opt/playbox"
  cp -r "$srcdir/playbox" "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  echo "[Desktop Entry]
Name=Playbox
GenericName=Playbox
Comment=A growing collection of board games.
Exec=playbox
Icon=/opt/playbox/icon.xpm
Terminal=false
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/playbox.desktop"
  echo "cd /opt/playbox/
./playbox -configuration ~/.config/playbox/ " > "$pkgdir/usr/bin/playbox"
  chmod +x "$pkgdir/usr/bin/playbox"
}

