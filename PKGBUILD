# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=chaos-equations-git
pkgver=r19.0fc5e2f
pkgrel=1
pkgdesc='Simple mathematical art'
arch=($CARCH)
url='https://github.com/MadManGaz/Chaos-Equations'
license=(MIT)
depends=(sfml)
makedepends=(git cmake)
source=("git+$url.git" font.patch)
sha256sums=('SKIP'
            '0778dcb913966d5546c0f9e1df065040bd790971c85eb67355a363bd3cd24c32')

pkgver() {
	cd Chaos-Equations
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd Chaos-Equations
	patch -p1 -i ../font.patch
}

build() {
	cmake -B build -G "Unix Makefiles" -S Chaos-Equations \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	install -Dm755 build/chaosequations -t "$pkgdir/usr/bin/"
	install -Dm644 Chaos-Equations/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
