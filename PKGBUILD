# Maintainer: Callum Parsey <neoninteger@protonmail.com>
pkgname=turtl-core-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="Turtl's logic core, built in Rust"
arch=("i686" "x86_64")
url="https://github.com/turtl/core-rs"
license=("GPL3")
depends=("libsodium" "openssl-1.0")
makedepends=("rust")

# Note: Turtl core-rs is versioned but not with Git tags or releases, the only
# way to download a specific core-rs version is using a commit hash that
# contains modifications to the CHANGELOG.md file.
_commithash="774fa361d021d9ef5237d32d09515ab7b2a32ad2"

source=("https://github.com/turtl/core-rs/archive/${_commithash}.tar.gz"
        "vars.mk")
sha256sums=("71c1caf3aeb6245040abb0ee063b574dd6ece6314c60edabbe4299a11df49b68"
            "8dd67ffa28f833baa88c57ecabcc0c5e020d53b5a5516034478a0883be29193d")

prepare() {
	cp vars.mk "core-rs-${_commithash}"
}

build() {
	cd "core-rs-${_commithash}"
	make release
}

package() {
	cd "core-rs-${_commithash}"
	install -Dm 755 target/release/libturtl_core.so -t "${pkgdir}/usr/lib"
}
