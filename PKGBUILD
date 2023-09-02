# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=hammer-editor
_pkgname2=hammer
pkgname=$_pkgname-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple tool for building stories (binary release)"
arch=('x86_64')
url="https://github.com/Wavesonics/hammer-editor"
license=('MIT')
depends=('xdg-utils')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/$_pkgname2.deb")
sha256sums=('5d8186844e34eb61d702e8913b2b00bb97d3013e0c30db99df1ec70d882d519f')

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
  rm -dr share & rm lib/$_pkgname2-$_pkgname2.desktop
  mv * "$pkgdir/opt/$_pkgname"
  ln -s /opt/$_pkgname2/bin/$_pkgname2 "$pkgdir/usr/bin/$_pkgname"
}
