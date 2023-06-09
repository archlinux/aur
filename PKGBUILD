# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=pleaserunthat
pkgver=1.21.0
pkgrel=1
pkgdesc="A python socket app for letting a friend execute a command on your system without opening ports or using an ssh server all, with a Simple GUI"
arch=('any')
url="https://github.com/Sebicodes99/pleaserunthat-beta"
license=('GPL3')
depends=('python')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  # Edit the shortcut
  cd $pkgname/Flatpak
  sed -i -E "s|Exec=runner.sh|Exec=python3 app.py|g" .desktop
  sed -i -E "s|Icon=io.github.Sebicodes99.Prt|Icon=pleaserunthat|g" .desktop
}

package() {
  cd $pkgname/Flatpak
  install -Dm644 io.github.Sebicodes99.Prt.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  install -Dm644 plruth.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 .desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 ../app.py "$pkgdir/usr/bin/$pkgname.py"
}
