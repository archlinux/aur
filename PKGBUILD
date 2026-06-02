
# Maintainer: xonoxc <xonoxc@users.noreply.github.com>

pkgname=sqlose-bin
pkgver={{PKGVER}}
pkgrel=1
pkgdesc="Sqlose - SQL development environment"
arch=('x86_64')
url="https://github.com/xonoxc/Sqlose"
license=('custom:Commercial')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib')
optdepends=('fuse2: for running AppImages')
provides=('sqlose')
conflicts=('sqlose')
source=("https://github.com/xonoxc/Sqlose/releases/download/v{{VERSION}}/Sqlose-Linux-{{VERSION}}.AppImage")
sha256sums=('{{SHA256SUM}}')

package() {
  install -Dm755 "$srcdir/Sqlose-Linux-{{VERSION}}.AppImage" "$pkgdir/opt/sqlose/Sqlose.AppImage"

  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/sqlose" << 'WRAPPER'
#!/bin/sh
exec /opt/sqlose/Sqlose.AppImage "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/sqlose"
}
