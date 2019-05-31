# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=geolocate-git
pkgbase=geolocate
pkgver=geolocate.r1.53fb9b1
pkgrel=1
pkgdesc="Obtain an ip's approximate latitude and longitude in a simplistic format (latitude:longitude)"
url="https://github.com/Baitinq/geolocate"
depends=('bash' 'curl' 'jq' 'gnu-netcat')
makedepends=('git')
license=('GPL')
arch=('any')
source=("git://github.com/Baitinq/geolocate")
provides=('geolocate')

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

prepare() {
  if [ -d "$srcdir/$pkgname" ]; then
    rm -rf "$srcdir/$pkgname"
  fi

  mkdir -p "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
}

pkgver() {
  cd "$srcdir/$pkgbase"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )

package() {
  cd "$srcdir/$pkgbase"

  # Install the program.
  install -Dm755 geolocate "${pkgdir}/usr/bin/geolocate"
  chmod +x "$pkgdir/usr/bin/geolocate"
}
