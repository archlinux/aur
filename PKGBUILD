# Maintainer: H. Ryott Glayzer <code@ryott.gay>
# Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
pkgname=beamer-theme-metropolis
pkgver=1.2
pkgrel=1
pkgdesc="A modern LaTeX Beamer theme"
url="https://github.com/matze/mtheme"
arch=("any")
license=("custom:cc-by-sa-4.0")
depends=("texlive-core" "texlive-pictures" "ttf-fira-sans")
source=($pkgname::git+https://github.com/matze/mtheme.git)
install=${pkgname}.install
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # Generate the style files.
    cd "$srcdir/$pkgname"
    make
}

package() {
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/$TEXMFDIST" install
}

