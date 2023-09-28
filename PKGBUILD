# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=hammer-editor
_pkgname2=hammer
pkgname=$_pkgname-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="A simple tool for building stories (binary release)"
arch=('x86_64')
url="https://github.com/Wavesonics/hammer-editor"
license=('MIT')
depends=('xdg-utils')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/$_pkgname2.deb")
sha256sums=('3c7b4d836764ad4a058b4356b9efa7c57bcc042129cf11a31857a9fd56970911')

prepare() {
  # Extract
  tar --use-compress-program=unzstd -xf data.tar.zst
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  # Install
  cd opt/$_pkgname2
  install -Dm644 lib/$_pkgname2-$_pkgname2.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 share/doc/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  rm -dr share lib/$_pkgname2-$_pkgname2.desktop
  mv * "$pkgdir/opt/$_pkgname"
  ln -s /opt/$_pkgname2/bin/$_pkgname2 "$pkgdir/usr/bin/$_pkgname"
}
