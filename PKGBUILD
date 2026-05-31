# maintainer: your name aray.4iv3@gmail.com
pkgname=deppull-git
pkgver=1.0.0.r1.18d497e
pkgrel=6
pkgdesc="a minimalist, lightning-fast c++ utility to fetch and extract github dependencies into a third_party directory"
arch=('x86_64')
url="https://github.com/aray4iv3/deppull"
license=('MIT')
depends=('curl' 'nlohmann-json')
makedepends=('cmake' 'gcc' 'git')
provides=('deppull')
conflicts=('deppull')

source=("deppull-git::git+https://github.com/aray4iv3/cdeppull.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/deppull-git"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/build"
     
    cmake -B "$srcdir/build" -S "$srcdir/deppull-git" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build "$srcdir/build"
}

package() {
    install -Dm755 "$srcdir/build/cmake-deps" "$pkgdir/usr/bin/deppull"
}
