# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency (binary release)"
url="https://github.com/Daniele-rolli/Beaver-Notes"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/main/LICENSE")
sha256sums=('SKIP')
source_x86_64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.x86_64.rpm")
source_aarch64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.aarch64.rpm")
sha256sums_x86_64=('e368f293e125256c360a42768d317684738b5bab7ea3cff077d5aeb02c8e587f')
sha256sums_aarch64=('372dd56083839f9343fc8b6e54b501cc1ba0e4e10e55500b07fa535424961288')

prepare() {
# Edit the shortcut
  mv usr/share/applications/$_pkgname.desktop "$srcdir"
  sed -i -E "s|Name=Beaver-notes|Name=Beaver Notes|g" $_pkgname.desktop
  sed -i -E "s|StartupWMClass=Beaver-notes|StartupWMClass=Beaver Notes|g" $_pkgname.desktop
}

package() {
# Create a directory
  mkdir -p "$pkgdir/usr/bin"
# Install
  mv opt "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  ln -s /opt/Beaver-notes/$_pkgname "$pkgdir/usr/bin"
}
