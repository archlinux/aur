# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=beamer-theme-m-git
pkgver=20150722
pkgrel=2
pkgdesc="A modern LaTeX Beamer theme"
url="https://github.com/matze/mtheme"
arch=("any")
license=("custom:cc-by-sa-4.0")
depends=("texlive-core" "texlive-pictures" "ttf-fira-sans" "ttf-fira-mono")
source=("git+https://github.com/matze/mtheme.git")
install=(mtheme.install)
sha512sums=('SKIP')

pkgver() {
    # Identify latest version.
    cd "$srcdir/mtheme"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    # Generate the style files.
    cd $srcdir/mtheme
    make
}

package() {
    cd $srcdir/mtheme
    TEXMFROOT=$(kpsewhich -var-value=TEXMFROOT)
    make TEXMFHOME=$pkgdir/$TEXMFROOT install
}
