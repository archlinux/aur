# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency (binary release)"
url="https://github.com/Daniele-rolli/Beaver-Notes"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/main/LICENSE")
source_aarch64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.aarch64.rpm")
source_x86_64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.x86_64.rpm")
sha256sums=('SKIP')
sha256sums_aarch64=('e6bc56d9d62bb23a6be0f5eef1390a1bb4a42631629a8c11b2b54f29ef9dbc82')
sha256sums_x86_64=('ee58ba0f5bd3ae29e31b260a2a02f21e7b37d7b9cb3864072cc336b9091e6a26')

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
