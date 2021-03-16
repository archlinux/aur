# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=obs-openvr-git
pkgver=0.1.0.r0.9acff37
pkgrel=1
pkgdesc="obs source plugin for capturing OpenVR outputs"
arch=(x86_64)
url="https://gitlab.com/mcoffin/obs-openvr"
license=('GPL')
groups=()
depends=('openvr' 'glfw>=3.0.0')
makedepends=('git' 'cargo' 'obs-studio') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://gitlab.com/mcoffin/obs-openvr.git#branch=master")
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cargo test --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 0644 -T target/release/libobs_openvr.so "$pkgdir"/usr/lib/obs-plugins/obs-openvr.so
}
