# Maintainer: Bryan Ndjeutcha <ndjeutcha@gmail.com>
pkgname=kile-wl
pkgver=r104.b10ba7d
pkgrel=1
pkgdesc="A tiling layout generator for river"
arch=('x86_64')
url="https://gitlab.com/snakedye/kile"
license=('MIT')
makedepends=('git' 'rust' 'scdoc')
provides=("kile-wl")
conflicts=("kile-wl")
source=("$pkgname::git+https://gitlab.com/snakedye/kile.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cargo build --release
  cd doc
  scdoc < kile.1.scd > kile.1.gz
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
	cd "$pkgname"
  install -Dm755 target/release/kile "$pkgdir/usr/bin/"
  install -Dm644 doc/*.1.gz "$pkgdir/usr/share/man/man1/"
}

