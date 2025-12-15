# Maintainer: [Fabien Devaux] <fdev31@gmail.com>
pkgname=loopino-git
pkgver=r62.4cd65b7
pkgrel=1
pkgdesc="Lightweight sampler for experimental sound design and rhythmic exploration"
arch=('x86_64')
url="https://github.com/brummer10/Loopino"
license=('unknown')
groups=()
depends=()
makedepends=('git' 'libsndfile' 'fftw' 'jack' 'cairo' 'libx11')
provides=("loopino")
conflicts=("loopino")
replaces=()
backup=()
options=()
install=
source=("Loopino::git+https://github.com/brummer10/Loopino.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Loopino"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Loopino"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/Loopino"
    make
}

check() {
    cd "$srcdir/Loopino"
    # No check target in Makefile
    true
}

package() {
    cd "$srcdir/Loopino"
    make DESTDIR="$pkgdir/" install
    rm -fr "$pkgdir/usr/share/pixmaps"
}
