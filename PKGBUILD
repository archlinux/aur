# Maintainer: Eduard Toloza <tolosaeduard@gmail.com>

pkgname=upcheck
pkgver=0.1.3
pkgrel=1
pkgdesc='Checker for ArchLinux available updates and send it via notify-rust.'
arch=('x86_64')
url='https://gitlab.com/edu4rdshl/upcheck'
license=('GPL3')
depends=('pacman-contrib')
makedepends=('git' 'cargo')
source=("git+https://github.com/Edu4rdSHL/$pkgname.git")
sha512sums=('SKIP')

build() {
  cd $pkgname

  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 755 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm 644 "$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
