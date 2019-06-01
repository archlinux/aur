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
source=("git://github.com/$author/$pkgbase")
provides=('geolocate')

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgbase"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$pkgbase"
  install -Dm755 geolocate "${pkgdir}/usr/bin/$pkgbase"
  chmod +x "$pkgdir/usr/bin/$pkgbase"
  install -Dm 644 $pkgbase.service \
    "$pkgdir/etc/systemd/system/$pkgbase.service"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgbase"
  chmod -R 777 "$pkgdir/usr/share/$pkgbase"
}
