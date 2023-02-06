# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.2
pkgrel=2
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
makedepends=('go>=1.19')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('37ca511089ce1491bddfead3b12e41ffa12f75132e681580377313aee68994128b31f2562472cbe59478ca765e55f3b5e58369a4d905ae35218bc706cdf595f0')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X main.Version=$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/local/bin"
  mkdir -p "$pkgdir/usr/share/X11/xorg.conf.d"
  mkdir -p "$pkgdir/etc/udev/rules.d/"
  mkdir -p "$pkgdir/etc/sway/config.d/"
  install dotool dotoolc dotoold "$pkgdir/usr/local/bin/"
  install "50-dotool.conf" "$pkgdir/usr/share/X11/xorg.conf.d/50-dotool.conf"
  install "80-dotool.rules" "$pkgdir/etc/udev/rules.d/80-dotool.rules"
  install "dotool.sway" "$pkgdir/etc/sway/config.d/dotool.sway"
}

