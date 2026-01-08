pkgname='cmdjewel-git'
pkgver=0.3.0
pkgrel=1
pkgdesc='Terminal match-3 game inspired by Bejeweled - latest build from source'
arch=(any)
url='https://codeberg.org/pastthepixels/cmdjewel'
source=("git+$url.git")
license=('GPL-3.0-only')
makedepends=('rust>=1.92.0' 'alsa-lib' 'clang' 'git')
sha256sums=('SKIP')

pkgver() {
	sed -nr 's/^version \= "(.*)"/\1/p' cmdjewel/cmdjewel/Cargo.toml
}

build() {
	cd cmdjewel
	CFLAGS="-lit2play" cargo build --release
}

package() {
	install -Dm 0755 cmdjewel/target/release/cmdjewel $pkgdir/usr/bin/cmdjewel
}
