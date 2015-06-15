# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=beamer-theme-m-git
pkgver=20150615
pkgrel=1
pkgdesc="A modern LaTeX Beamer theme"
url="https://github.com/matze/mtheme"
arch=("any")
license=("custom:cc-by-sa-4.0")
depends=("texlive-core")
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
    latex mtheme.ins
}

package() {
    # Create the necessary directories in pkgdir.
    mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/{theme,font,color}

    # Copy the .sty files over.
    cd $srcdir/mtheme
    install -m644 beamerthemem.sty               ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/theme
    install -m644 beamerfontthememetropolis.sty  ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/font
    install -m644 beamercolorthememetropolis.sty ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/color
    
}
