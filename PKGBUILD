# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=hammer-editor
pkgname=$_pkgname-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple tool for building stories (binary release)"
url="https://github.com/Wavesonics/hammer-editor"
license=('MIT')
arch=('x86_64')
depends=('xdg-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/hammer.deb")
sha256sums=('24e321e21c2ffc330c3c29679e54f5419b9132559ad975257ff5578281910db4')

package() {
# Create a directory
  mkdir -p "$pkgdir/usr/bin"
# Extract
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
# Clean up
  cd "$pkgdir/opt/hammer"
  install -Dm644 lib/hammer-hammer.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 share/doc/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  rm -dr share lib/hammer-hammer.desktop
  ln -s /opt/hammer/bin/hammer "$pkgdir/usr/bin/$_pkgname"
}
