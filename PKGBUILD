# Maintainer: Mark Rodgers <mark@marknrodgers.com>
# Inspired by macbook-lighter, many thanks to https://github.com/harttle/macbook-lighter
pkgname=macbook-lighter-radeon
pkgver=v0.0.2.9.g0050e61
pkgrel=1
pkgdesc="Macbook screen/keyboard backlight CLI and auto-adjust on ambient light for Radeon GPUs"
arch=(any)
url="https://github.com/mark-rodgers/macbook-lighter-radeon"
license=('GPL')
depends=('bc')
makedepends=('git')
source=('git+https://github.com/mark-rodgers/macbook-lighter-radeon.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$pkgname"
  [ ! -f $pkgdir/etc/macbook-lighter-radeon.conf ] && install -Dm644 macbook-lighter-radeon.conf $pkgdir/etc/macbook-lighter-radeon.conf
  install -Dm644 "macbook-lighter-radeon.service" "$pkgdir/usr/lib/systemd/system/macbook-lighter-radeon.service"
  install -Dm755 "src/macbook-lighter-ambient.sh" "$pkgdir/usr/bin/macbook-lighter-ambient"
  install -Dm755 "src/macbook-lighter-screen.sh" "$pkgdir/usr/bin/macbook-lighter-screen"
  install -Dm755 "src/macbook-lighter-kbd.sh" "$pkgdir/usr/bin/macbook-lighter-kbd"
}
