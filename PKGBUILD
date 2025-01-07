# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: tee <teeaur at duck dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency (binary release)"
url="https://github.com/Daniele-rolli/Beaver-Notes"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/$pkgver/LICENSE")
source_aarch64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.aarch64.rpm")
source_x86_64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.x86_64.rpm")
sha256sums=('593ed481f41652b46705e544226e0b58ffc046138f6a34777a0092e8d1f54b1d')
sha256sums_x86_64=('3a4feefb1047a46c5acfb22d3f33eca4de95ce64d131d552c715a0c79aa97566')
sha256sums_aarch64=('a8aad6ff8e0b419f85e4b37a376a6e254cf78a5c6b70c8f96606814df2af9cab')

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
