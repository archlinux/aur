pkgname="arnavs-wordle-solver-git"
pkgver=0.1
pkgrel=1
pkgdesc="A Wordle solver."
# it should be just C code
# actually tested only on x86_64 and i686 (iSH)
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/Arnav814/wordle-solver-v3"
license=("MIT")

# haven't tried with anything lower
depends=("ncurses>=6.4.4")
makedepends=("git" "cmake")

sha256sums=("SKIP")
source=("git+$url#branch=main")

build() {
	cmake \
		-B build \
		-S wordle-solver-v3 \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 # just build the thing
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

