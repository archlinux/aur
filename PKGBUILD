# Maintainer: harttle <yangjvn@126.com>
# Inspired by lighter, many thanks to Janhouse's perl script https://github.com/Janhouse/lighter
pkgname=macbook-lighter-git
_pkgname=macbook-lighter
pkgver=v0.0.2.1.g4441c81
pkgrel=1
pkgdesc="Macbook screen/keyboard backlight CLI and auto-adjust on ambient light"
arch=(any)
url="https://github.com/harttle/macbook-lighter"
license=('GPL')
depends=('perl')
makedepends=('git')
provides=(macbook-lighter macbook-lighter-kbd macbook-lighter-screen)
conflicts=(macbook-lighter macbook-lighter-kbd macbook-lighter-screen)
source=('git+https://github.com/harttle/macbook-lighter.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cpan IO::Async::Stream
  cd "$srcdir/$_pkgname"
  install -Dm644 "macbook-lighter.service" "$pkgdir/usr/lib/systemd/system/macbook-lighter.service"
  install -Dm755 "src/macbook-lighter-ambient.pl" "$pkgdir/usr/bin/macbook-lighter-ambient"
  install -Dm755 "src/macbook-lighter-screen.sh" "$pkgdir/usr/bin/macbook-lighter-screen"
  install -Dm755 "src/macbook-lighter-kbd.sh" "$pkgdir/usr/bin/macbook-lighter-kbd"
}
