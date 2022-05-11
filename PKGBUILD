# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Krzysztof Bochm <bochmkrzysztof@gmail.com>
pkgname=kb-simple-http-server-git
pkgver=1.0.2.r116.a33d5af
pkgrel=1
epoch=
pkgdesc="Simple http server scripted in lua"
arch=(x86_64)
url="https://gitlab.com/bochmkrzysztof/http-server.git#tag=v1.1.0"
license=('MIT')
groups=()
depends=(boost lua liburing)
makedepends=(gcc ninja cmake git)
checkdepends=()
optdepends=()
provides=(kb-simple-http-server)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "1.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "http-server"
    git submodule init; git submodule update
}

build() {
	cd "http-server"
    mkdir build -p
    cd build
    cmake .. -G Ninja -D CMAKE_INSTALL_PREFIX="/usr"
    ninja
}

package() {
    cd "http-server"
    cd build
    DESTDIR="${pkgdir}/" ninja install
}
