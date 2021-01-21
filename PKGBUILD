# Maintainer: Jamie Quigley <jamie at quigley dot xyz>

pkgname='fuzz-git'
pkgver=r2.d19ffd9
pkgrel=2
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
    sed -i -e /"CC.*="/d src/Makefile             # makepkg will specify CC
    sed -i -e /"CPP.*="/d src/Makefile            # makepkg will specify CPP
    sed -i -e 's/\/usr\/local/\/usr/' src/param.c # A path with a reference to /usr/local is hardcoded
    make
}

package() {
    cd "$pkgname"
    install -Dm 755 src/fuzz "$pkgdir/usr/bin/fuzz"
    install -Dm 644 src/fuzzlib "$pkgdir/usr/lib/fuzzlib"
    install -Dm 644 tex/fuzz.sty "$pkgdir/usr/share/texmf-dist/tex/fuzz.sty"
    install -Dm 655 tex/oxsz.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz.mf"
    install -Dm 655 tex/oxsz5.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz5.mf"
    install -Dm 655 tex/oxsz6.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz6.mf"
    install -Dm 655 tex/oxsz7.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz7.mf"
    install -Dm 655 tex/oxsz8.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz8.mf"
    install -Dm 655 tex/oxsz9.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz9.mf"
    install -Dm 655 tex/oxsz10.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/oxsz10.mf"
    install -Dm 655 tex/tut.tex "$pkgdir/usr/share/texmf-dist/fonts/source/local/tut.tex"
    install -Dm 655 tex/zarrow.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/zarrow.mf"
    install -Dm 655 tex/zletter.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/zletter.mf"
    install -Dm 655 tex/zsymbol.mf "$pkgdir/usr/share/texmf-dist/fonts/source/local/zsymbol.mf"
}
