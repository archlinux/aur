#Maintainer: 0x182d4454fb211940 <ianwoodformal@gmail.com>

pkgname=ilo-sitelen-git
pkgver=r4.cfacb08
pkgrel=1
pkgdesc="An fcitx5 IME for sitelen pona."
arch=("x86_64")
url="https://github.com/0x182d4454fb211940/ilo-sitelen"
license=("MIT")
groups=()
depends=("fcitx5")
makedepends=("cmake>=3.21" "git")
checkdepends=()
optdepends=()
provides=("${pkgname%-git}.so")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("ilo-sitelen::git+https://github.com/0x182d4454fb211940/ilo-sitelen.git")
noextract=()
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$srcdir/${pkgname%-git}" \
	  -DCMAKE_INSTALL_PREFIX="/usr" \
	  -DCMAKE_SKIP_INSTALL_RPATH=YES \
	  -DCMAKE_BUILD_TYPE=None \
	  -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
