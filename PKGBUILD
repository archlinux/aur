# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=hammer-editor
_pkgname2=hammer
pkgname=$_pkgname-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple tool for building stories (binary release)"
arch=('x86_64')
url="https://github.com/Wavesonics/hammer-editor"
license=('MIT')
depends=('xdg-utils')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/$_pkgname2.deb")
sha256sums=('45548e6414c0f5b6c79edea0ed7ade8e8ff2133ffb748188f1f0d6775968ca0e')

prepare() {
  # Extract
  tar --use-compress-program=unzstd -xvf data.tar.zst
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  # Install
  cd opt/$_pkgname2
  install -Dm644 lib/$_pkgname2-$_pkgname2.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 share/doc/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  rm -dr share & rm lib/$_pkgname2-$_pkgname2.desktop
  cp -r ../$_pkgname2 "$pkgdir/opt/$_pkgname2"
  ln -s /opt/$_pkgname2/bin/$_pkgname2 "$pkgdir/usr/bin/$_pkgname"
}
