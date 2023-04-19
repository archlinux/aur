# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=albumartcreator
pkgname=$_pkgname-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="Create amazing looking Album Art in seconds! (binary release)"
arch=('x86_64')
url="https://github.com/0neGal/albumArtCreator"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
_desktop=albumartcreator.desktop
_url2=https://raw.githubusercontent.com/0neGal/albumArtCreator/997db65bac74ce8d9ce13980ba1252523303d6e1
source=("$url/releases/download/$pkgver-beta/linux-albumartcreator-v$pkgver-beta.tar.gz"
        "$_url2/icons/icon.png"
        "$_url2/README.md"
        "$_url2/LICENSE")
sha256sums=('149ab4af47811a444269fd416cb3bbefcf301b694471cf48ded108c83d6f5d84'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Music;" >> $_desktop
  sed -i '1 i\Comment=A simple tool to make it easy to create good looking album art' $_desktop
  sed -i '1 i\StartupWMClass=Album Art Creator' $_desktop
  sed -i '1 i\Icon=albumartcreator' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=/opt/albumArtCreator/albumartcreator %U' $_desktop
  sed -i '1 i\Name=Album Art Creator' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop
}

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  cp -r $_pkgname-linux-x64 $pkgdir/opt/albumArtCreator
  ln -s /opt/albumArtCreator/albumartcreator $pkgdir/usr/bin/$_pkgname
  # Install
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 desktop/$_desktop "$pkgdir/usr/share/applications/$_desktop"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
