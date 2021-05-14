# Maintainer: Bryan Ndjeutcha <ndjeutcha@gmail.com>
pkgname=kile-wl
pkgver=r152.4e2f3be
pkgrel=1
pkgdesc="A tiling layout generator for river"
arch=('x86_64')
url="https://gitlab.com/snakedye/kile"
license=('MIT')
makedepends=('git' 'rust')
optdepends=('scdoc')
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
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
	cd "$pkgname"
  install -Dm755 target/release/kile "$pkgdir/usr/bin/"
  if [ -e doc/*.1.gz ]; then
    install -Dm644 doc/*.1.gz "$pkgdir/usr/share/man/man1/"
  fi
}

