# Maintainer: Aidan Dang <dang at aidan dot gg>

pkgname=infnoise
pkgver=0.3.0
pkgrel=1
pkgdesc="The world's easiest TRNG to get right"
arch=('x86_64')
url="https://github.com/waywardgeek/infnoise"
license=('custom')
depends=('libftdi-compat')
backup=("etc/infnoise.conf")
source=("https://13-37.org/files/$pkgname-$pkgver.tar.gz"
        "https://13-37.org/files/$pkgname-$pkgver.tar.gz.sig"
        "https://github.com/13-37-org/$pkgname/raw/$pkgver/LICENSE")
sha256sums=('7d10f0ea769da5b538983df2c1bf7188dc882bf12c4bf1c471f47ec17ba1ff71'
            'SKIP'
            '36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673')
validpgpkeys=('71AE099B262DC0B493E6EE71975DC25C4E730A3C')

build() {
  make -f Makefile.linux
}

package() {
  install -Dm644 "LICENSE"                            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "init_scripts/75-infnoise.rules"     "$pkgdir/usr/lib/udev/rules.d/75-infnoise.rules"
  install -Dm644 "init_scripts/infnoise.conf.systemd" "$pkgdir/etc/infnoise.conf"
  install -Dm644 "init_scripts/infnoise.service.bin"  "$pkgdir/usr/lib/systemd/system/infnoise.service"
  install -Dm755 "infnoise"                           "$pkgdir/usr/bin/infnoise"
  install -Dm755 "libinfnoise.so"                     "$pkgdir/usr/lib/libinfnoise.so"
}
