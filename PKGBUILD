# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=hammer-editor
pkgname=$_pkgname-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="A simple tool for building stories (binary release)"
url="https://github.com/Wavesonics/hammer-editor"
license=('MIT')
arch=('x86_64')
depends=('xdg-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/hammer.deb")
sha256sums=('a3e901ff3230ec752030142b41bbcbdbdf4b20b6d00fa894193140ec94eeffec')

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
