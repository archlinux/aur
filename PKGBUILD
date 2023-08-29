# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=albumartcreator
pkgname=$_pkgname-bin
_pkgver=0.1.2
pkgver=0.1.2_beta
pkgrel=5
pkgdesc="Create amazing looking Album Art in seconds! (binary release)"
arch=('x86_64')
url="https://github.com/0neGal/albumArtCreator"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/$_pkgver-beta/linux-albumartcreator-v$_pkgver-beta.tar.gz"
        "$url/raw/0.1.2-beta/icons/icon.png")
sha256sums=('149ab4af47811a444269fd416cb3bbefcf301b694471cf48ded108c83d6f5d84'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Music;" >> desktop
  sed -i '1 i\Comment=A simple tool to make it easy to create good looking album art' desktop
  sed -i '1 i\StartupWMClass=Album Art Creator' desktop
  sed -i '1 i\Icon=albumartcreator' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=/opt/albumArtCreator/albumartcreator %U' desktop
  sed -i '1 i\Name=Album Art Creator' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/albumArtCreator" "$pkgdir/usr/bin"
  # Install
  mv $_pkgname-linux-x64/* "$pkgdir/opt/albumArtCreator"
  ln -s /opt/albumArtCreator/albumartcreator "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
}
