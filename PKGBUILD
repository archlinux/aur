# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=tcp-brutal
pkgname=${_pkgbase}-dkms
pkgver=1.0.1
pkgrel=1
pkgdesc="Hysteria's congestion control algorithm ported to kernel mode TCP - module sources"
url='https://github.com/apernet/tcp-brutal'
license=('GPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('dkms')
source=("$_pkgbase-$pkgver-$pkgrel.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz"
        'dkms.conf')
sha256sums=('cd55898e9ee5d98f7fd2726427717d0fecaa3f5550e96269e2c7bd491f0002bf'
            '946067020f48887d297396e0ea964580a20b7d01e17aab5841d1a47ebce8dbd0')

package() {
  cd "$_pkgbase-$pkgver"

  local _targetdir="$pkgdir/usr/src/$pkgbase-$pkgver"
  install -dm755 "$_targetdir"

  install -Dm644 "$srcdir/dkms.conf" "$_targetdir/dkms.conf"
  sed -i 's/PACKAGE_VERSION=.*/PACKAGE_VERSION="'"$pkgver"'"/' "$_targetdir/dkms.conf"

  install -Dm644 Makefile "$_targetdir/Makefile"
  install -Dm644 *.c "$_targetdir/"
}
