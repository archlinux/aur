# Maintainer: Madhur Ahuja <ahuja.madhur@gmail.com>
pkgname=csvlens-git
pkgver=0.5.0.d023864
pkgrel=1
pkgdesc='csvlens is a command line CSV file viewer. It is like less but made for CSV.'
arch=('x86_64')
url='https://github.com/YS-L/csvlens'
license=('MIT')
makedepends=('git' 'rust')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release 
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/csvlens "$pkgdir/usr/bin/csvlens"

}
