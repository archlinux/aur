# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency (binary release)"
url="https://github.com/Daniele-rolli/Beaver-Notes"
arch=('x86_64' 'aarch64')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/$pkgver/LICENSE")
sha256sums=('SKIP')
source_x86_64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.x86_64.rpm")
source_aarch64=("$url/releases/download/$pkgver/Beaver-notes-$pkgver.aarch64.rpm")
sha256sums_x86_64=('cedf420aeacf8907060e5082bdc6b9a4388cde8019a2349e79c47466c5ffa7ce')
sha256sums_aarch64=('a3b161cebd1840d430e77b6748378099162bdc3366e61a377494932caa595dc7')

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
