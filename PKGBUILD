# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <pasha.sidorovich@gmail.com>

pkgname=userver-community
pkgver=2.7
pkgrel=1
epoch=
pkgdesc=""
arch=("x86_64")
url="https://userver.tech/index.html"
license=('Apache-2.0')
groups=()
depends=('clang' 'cmake' 'python' 'boost' 'hiredis' 'librdkafka')
makedepends=('ninja')
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
	"https://github.com/userver-framework/userver/archive/refs/tags/v$pkgver.tar.gz"
	"Makefile.local")
noextract=()
sha256sums=(
	"5f22faf8570e67e4b666e21ea3e8ddad0dc6d7c6825d7b1ce38f666140db1b41"
	"2942846540235a4eed235f3204108698b78fcc369bfe0e85699eacdfec3bb228")
validpgpkeys=()

prepare() {
	cd "userver-$pkgver"
	cp "$srcdir/Makefile.local" "."
}

build() {
	cd "userver-$pkgver"

	make cmake-debug
	make build-debug

	make cmake-release
	make build-release
}

package() {
	cd "userver-$pkgver"

	DESTDIR="$pkgdir" cmake --install build_debug
	DESTDIR="$pkgdir" cmake --install build_debug
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/userver/LICENSE
}
