# Maintainer: [Fabien Devaux] <fdev31@gmail.com>
pkgname=loopino-git
pkgver=r62.4cd65b7
pkgrel=2
pkgdesc="Lightweight sampler for experimental sound design and rhythmic exploration"
arch=('x86_64')
url="https://github.com/brummer10/Loopino"
license=(' BSD-3-Clause')
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    rm -fr "$pkgdir/usr/share/pixmaps"
    install -Dm644 loopino.png "${pkgdir}/usr/share/pixmaps/loopino.png"
}
