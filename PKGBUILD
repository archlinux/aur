# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
basename=spirv-cross
pkgname=$basename-git
pkgver=r1059.7be30aa
pkgrel=1
pkgdesc="Tool and library for performing reflection on SPIR-V and disassembling SPIR-V back to high level languages."
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-Cross"
license=('Apache2')
groups=()
depends=()
optdepends=()
makedepends=('cmake' 'git')
provides=("$basename")
conflicts=("$basename")
replaces=()
backup=()
options=()
install=
source=(
    'spirv-cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git'
)
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$basename"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$basename"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_PREFIX_PATH=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    cmake --build .
}

package() {
    cd "$srcdir/$basename/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$basename/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
