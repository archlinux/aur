# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: tee <teeaur at duck dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=4.4.0
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
sha256sums_x86_64=('510369954df2d5905f1ab6dd5c6f24f824615144ec16ae6d7aab526785fdfd2b')
sha256sums_aarch64=('d5dc75125cdf36fe91a76b46f7b8c408415571aa16a99914d71c0a1fbb88cfeb')

prepare() {
# Edit the shortcut
  mv "usr/share/applications/$_pkgname.desktop" "$srcdir"
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
    install -Dm644 "usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
  done
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  ln -s "/opt/Beaver notes/$_pkgname" "$pkgdir/usr/bin"
}
