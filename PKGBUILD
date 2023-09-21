# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency (binary release)"
url="https://github.com/Daniele-rolli/Beaver-Notes"
license=('MIT')
arch=('aarch64' 'x86_64')
depends=('electron')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/raw/0.0.8/LICENSE")
sha256sums=('SKIP')
source_aarch64=("$url/releases/download/0.0.8/Beaver-notes-0.0.8.aarch64.rpm")
source_x86_64=("$url/releases/download/0.0.8/Beaver-notes-0.0.8.x86_64.rpm")
sha256sums_aarch64=('79e5acc258e78921cc86dc889ed85fc44e3831cf4fdeec7179225fc5759fb2cf')
sha256sums_x86_64=('9a925f84faf1ef0fc118a139dd23a880081d405b289f7eb4096985916ae77860')

prepare() {
  # Edit the shortcut
  mv usr/share/applications/$_pkgname.desktop "$srcdir"
  sed -i -E "s|Name=Beaver-notes|Name=Beaver Notes|g" $_pkgname.desktop
  sed -i -E "s|StartupWMClass=Beaver-notes|StartupWMClass=Beaver Notes|g" $_pkgname.desktop
}

package() {
  # Create a folder
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
