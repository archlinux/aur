# Maintainer: Jamie Quigley <jamie at quigley dot xyz>

pkgname='fuzz-git'
pkgver=r2.d19ffd9
pkgrel=1
pkgdesc="The fuzz type checker for Z"
arch=('x86_64')
url="https://spivey.oriel.ox.ac.uk/corner/Fuzz_typechecker_for_Z"
license=('MIT')
depends=('texlive-core')
source=('fuzz-git::git://github.com/Spivoxity/fuzz.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    sed -i -e /"CC.*="/d src/Makefile
    sed -i -e /"CPP.*="/d src/Makefile
    sed -i -e 's/\/usr\/local/\/usr/' src/param.c
    make
}

package() {
    cd "$pkgname"
    install -Dm 755 src/fuzz "$pkgdir/usr/bin/fuzz"
    install -Dm 644 src/fuzzlib "$pkgdir/usr/lib/fuzzlib"
    install -Dm 644 tex/fuzz.sty "$pkgdir/usr/share/texmf-dist/tex/fuzz.sty"
    install -dm 655 "tex/*.mf" "$pkgdir/usr/share/texmf-dist/fonts/source/local"
}
