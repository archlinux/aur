# Maintainer: Seifane Idouchach <seifane@idoucha.ch>

pkgname=aur-build-worker
pkgver=0.30.0
pkgrel=1
epoch=
pkgdesc="Worker for aur-build-server"
arch=('any')
url="https://github.com/seifane/aur-build-server"
license=('GPL')
groups=()
depends=('git' 'libgit2' 'libssh2' 'openssl-1.1')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=('aur-build-worker')
replaces=()
backup=()
options=('!lto')
install=
changelog=
source=(git+https://github.com/seifane/aur-build-server.git#tag=$pkgver)
noextract=()
md5sums=(SKIP) #generate with 'makepkg -g'

prepare() {
	cd aur-build-server
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd aur-build-server
	cargo build --frozen --release --bin $pkgname
}

package() {
	cd aur-build-server
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
