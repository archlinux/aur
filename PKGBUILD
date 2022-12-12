# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=clap-validator-git
_pkgname=clap-validator
pkgver=0.1.0.r0.g9071ebf
pkgrel=1
pkgdesc="An automatic CLAP validation and testing tool"
epoch=
arch=('x86_64')
url="https://github.com/free-audio/clap-validator"
license=('MIT')
makedepends=('git' 'cargo')
provides=('clap-validator')
source=('git+https://github.com/free-audio/clap-validator')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
}
