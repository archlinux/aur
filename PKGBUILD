# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=tdf
pkgname=${_pkgname}-git
pkgver=20240605.r26.f893ecb
pkgrel=1
pkgdesc='A terminal-based PDF viewer'
url='https://github.com/itsjunetime/tdf'
license=('MPL-2.0')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('cairo' 'poppler-glib')
makedepends=('git' 'rustup')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/itsjunetime/tdf')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci main | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cargo build --release
}

package() {
  cd $_pkgname
  install -Dm755 ./target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
