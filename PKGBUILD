# Maintainer: David Germain <davi.germain@laposte.net>

pkgname=mod-desktop
pkgver=0.0.9
pkgrel=1
pkgdesc="MOD Desktop Application"
arch=('x86_64')
url="https://github.com/moddevices/mod-desktop"
license=('AGPLv3+')
depends=('pipewire-jack' 'pipewire')


source=("$pkgname-$pkgver-linux-$arch.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver-linux-$arch.tar.xz")

sha256sums=('5ede4c3501a33979881cbff435273b60923c20c4f5ba4120f06e50b9398cd091')

package() {
  # Replace the path in mod-desktop.desktop
  sed -i 's|Exec=bash -c '\''$(dirname "%k")/mod-desktop.run'\''|Exec=/opt/mod-desktop/mod-desktop|' "$srcdir/$pkgname-$pkgver-linux-$arch/$pkgname.desktop"

  # Install to /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver-linux-$arch/$pkgname"/* "$pkgdir/opt/$pkgname/"

  # Install desktop file from the extracted archive
  install -Dm644 "$pkgname-$pkgver-linux-$arch/mod-desktop.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

