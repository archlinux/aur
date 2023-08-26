# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=stlspy
pkgname=$_pkgname-bin
pkgver=1.0.0_beta1
pkgrel=1
pkgdesc="A way to discover and organise your 3d prints (binary release)"
arch=('x86_64')
url="https://github.com/suchmememanyskill/StlSpy"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_desktop=$_pkgname.desktop
source=("$_pkgname-$pkgver.7z::$url/releases/download/v1.0.0-beta1/Linux.7z"
        "$_pkgname.png::$url/raw/v1.0.0-beta1/StlSpy/Assets/icon.png")
sha256sums=('41b996bf86fc8f3878fd8412dcb66542475b7c7724fa193b2ae38e618342acb8'
            'SKIP')

prepare() {
  # "Create a shortcut"
  echo "Comment=A way to discover and organise your 3d prints" > $_desktop
  sed -i '1 i\StartupWMClass=StlSpy' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=stlspy %U' $_desktop
  sed -i '1 i\Name=StlSpy' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/opt/StlSpy"
  # Install
  mv Linux/* "$pkgdir/opt/StlSpy"
  ln -s /opt/StlSpy/StlSpy "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/1024x1024/apps"
}
