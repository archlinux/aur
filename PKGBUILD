# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-git
_reponame=websum
pkgver=r9.90f3e7e
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
provides=('websum')
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
depends=()
options=('!lto')
makedepends=('git' 'cargo' 'binutils')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"
	cargo build --release --target-dir target
}

package() {
    cd "$srcdir/$_reponame"
	install -Dm755 target/release/websum "${pkgdir}/usr/bin/websum"
}
