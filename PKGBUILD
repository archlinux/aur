# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=beaver-notes
pkgname=$_pkgname-bin
pkgver=2.1.1
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
sha256sums_x86_64=('c6ac1f5e3b19c106a595f07a15e71caf3165582100aae2ad89201e04357f095f')
sha256sums_aarch64=('d119b262ee508e2db245c6f9abe80f9de87c7ed1ed2cb39ad5c20ff36ea84d67')

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
