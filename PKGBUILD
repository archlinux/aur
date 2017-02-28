# Maintainer: Carlo Capocasa <carlo@capocasa.net>
pkgname=nanotts-git
pkgver=r46.2370600
pkgrel=1
epoch=
pkgdesc="The nanotts speech synthesizer (git version)"
arch=(x86_64)
url="https://github.com/gmn/nanotts"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"$pkgname::git+https://github.com/gmn/nanotts.git#branch=master"
)
noextract=()
md5sums=(
"SKIP"
)
validpgpkeys=()

prepare() {
	cd "$pkgname"
  sed -i "s#/usr/share/pico/lang#/usr/share/$pkgname/lang#" Makefile
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgname/nanotts" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R "$pkgname/lang" "$pkgdir/usr/share/$pkgname" 
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

