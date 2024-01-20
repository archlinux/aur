# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=hammer-editor
pkgname=$_pkgname-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A simple tool for building stories (binary release)"
url="https://github.com/Wavesonics/hammer-editor"
license=('MIT')
arch=('x86_64')
depends=('xdg-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/hammer.deb")
sha256sums=('2a3505a9b31a1e9e44efdf5a8b70284e66286264dc847017464a9159e1528a90')

prepare() {
  # Extract
  tar --use-compress-program=unzstd -xf data.tar.zst
}

package() {
  # Create directories
  mkdir -p "$pkgdir/opt/hammer" "$pkgdir/usr/bin"
  # Install
  cd opt/hammer
  install -Dm644 lib/hammer-hammer.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 share/doc/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  rm -dr share lib/hammer-hammer.desktop
  mv * "$pkgdir/opt/hammer"
  ln -s /opt/hammer/bin/hammer "$pkgdir/usr/bin/$_pkgname"
}
