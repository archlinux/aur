# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=2.7.0
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
sha256sums_x86_64=('d55c306f98d3a6b0e24a8e3fe0d766cc6eae03f6489ccda164e6324a275fd8db')
sha256sums_aarch64=('f7b78a0e57ddab9257b6f5ac2c28839781a80de9745e6da59ea9809f2b3f75dc')

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
