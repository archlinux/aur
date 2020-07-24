# Maintainer: Ryan Greenup <ryan.greenup@protonmail.com>

pkgname=cadmus-notes
pkgver=0.2
pkgrel=1
pkgdesc="Modular Shell Scripts for an MD Notebook"
arch=('x86_64')
url="ryangreenup.github.io/cadmus"
license=('GPL3')
provides=('cadmus')
depends=(
    recoll
    tmsu
    ripgrep
    fd
    nodejs
    bat
    coreutils
    sed
    grep
    jq
    pandoc
    ranger
    recode
    sd
    skim
    xclip
    iproute2
)
## These aren't in the official repos and could have
## been installed with cargo
optdepends=('nodejs-markserv: Preview Support'
            'tectonic: Additional option for PDF Export'
            'mdcat: Pretty Print'
            ## These are just optional
            'texlive-core: PDF Export'
            'wl-clipboard: Clipboard for Wayland')

source=("git+https://github.com/RyanGreenup/cadmus.git")
# source=("git+https://github.com/RyanGreenup/cadmus.git#branch=makepkg")
 sha256sums=('SKIP')

package() {
################################################################################
# If I wanted to actually install it by splitting up the binaries and resources
################################################################################

#  install -Dm755 "$srcdir/cadmus/bin/*" -t "${pkgdir}/usr/bin/"
#  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
# install -d "${srcdir}/cadmus/" -Dt "${pkgdir}/$HOME/.cadmus"

################################################################################
# Using the portable philosphy that I've previously settled on
################################################################################

 mkdir -p "${pkgdir}/$HOME/.cadmus";
 mkdir -p "${pkgdir}/$HOME/.local/bin"
 rsync -av ${srcdir}/cadmus/* "${pkgdir}/$HOME/.cadmus/"
 ln -rsf "${pkgdir}/$HOME/.cadmus/bin/cadmus" "${pkgdir}/$HOME/.local/bin"

chmod 700 "${pkgdir}/$HOME"
chmod 755 "${pkgdir}/$HOME/.cadmus"
chmod 700 "${pkgdir}/$HOME/.local"

}
