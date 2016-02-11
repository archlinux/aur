# Maintainer: Stephen Bell <theredbaron1834 @ yahoo.com>
pkgname=playbox
pkgrel=1
pkgver=$(curl https://sourceforge.net/projects/playbox/files/6/ | grep "latest/download?" | sed s'/ /\n/g' | grep title | sed -e 's/title="//g' -e 's/://g' -e 's/\/6\/playbox-//g' -e 's/.linux/\n/g' | head -n 1)
pkgdesc="A growing collection of board games."
arch=('x86_64')
url="http://sourceforge.net/projects/playbox/"
license=('Eclipse Public License')
depends=('gtk3')
makedepends=('unzip')

build() {

  msg "Grabbing files...."
  pkg=$(curl https://sourceforge.net/projects/playbox/files/6/ | grep "latest/download?" | sed s'/ /\n/g' | grep title | sed -e 's/title="//g' -e 's/://g')
  pkg=$(echo http://sourceforge.net/projects/playbox/files$pkg/download -L -o playbox.zip)
  curl $pkg
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

