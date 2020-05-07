# Maintainer: Sem Lindhout <capnhawkbill at airmail dot cc>
pkgname=amethyst-tools-git
pkgver=r316.83ef9c6
pkgrel=1
pkgdesc="Command-line interface for the Amethyst engine to create and deploy game projects."
arch=('any')
url="https://github.com/amethyst/tools"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/amethyst/tools.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 target/release/amethyst -t "${pkgdir}/usr/bin"
}
