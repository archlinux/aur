# Maintainer: David Germain <davi.germain@laposte.net>

pkgname=mod-desktop-bin
provides=(${pkgname//-bin/""})
pkgver=0.0.11
pkgrel=2
pkgdesc="MOD Desktop Application"
arch=('x86_64')
url="https://github.com/moddevices/mod-desktop"
license=('AGPLv3+')
conflicts=("$provides" "$provides-git")

source=("$provides-$pkgver-linux-$arch.tar.xz::$url/releases/download/$pkgver/$provides-$pkgver-linux-$arch.tar.xz")

sha256sums=('239ce464e7fe24fc7f1c5bf2ad3e5095a3ef202c735aced9dd395f632eb71f2a')

package() {
  # Replace the path in mod-desktop.desktop
  sed -i 's|Exec=bash -c '\''$(dirname "%k")/mod-desktop.run'\''|Exec=/opt/mod-desktop/mod-desktop|' "$srcdir/$provides-$pkgver-linux-$arch/$provides.desktop"

  # Install to /opt
  install -d "$pkgdir/opt/$provides"
  cp -r "$srcdir/$provides-$pkgver-linux-$arch/$provides"/* "$pkgdir/opt/$provides/"


  # Install desktop file from the extracted archive
  install -Dm644 "$provides-$pkgver-linux-$arch/mod-desktop.desktop" "$pkgdir/usr/share/applications/$provides.desktop"
}
