pkgname=ev-cmd
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Simple command runner I made for my Koolertron macropad"
arch=('x86_64')
url="https://github.com/danhab99/ev-cmd"
license=('MIT')
groups=()
depends=(rust)
makedepends=(rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# source=("$pkgname-$pkgver.tar.gz")
source=("$url/tarball/$pkgver")
noextract=()
sha256sums=('b529a0f0bed58bd76f19407510ee662375f3305821507d4bd3f9fa8c13a266bc')
validpgpkeys=()

prepare() {
  _dirname=$(tar -tf "${source[0]##*/}" | head -n 1 | cut -d/ -f1)
  mv $_dirname $pkgname-$pkgver
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo check
}

package() {
	cd "$pkgname-$pkgver"
	install -m0755 target/release/ev-cmd /usr/bin/ev-cmd
}
