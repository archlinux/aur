# Maintainer: Gingka/Ginger Pepper <gingkathfox @ gmail . com>
pkgname=uwupp-git
pkgver=0.2.0.r4.g4fcc0fe
pkgrel=1
pkgdesc="The next generation esoteric language."
arch=('x86_64')
url="https://github.com/Deltaphish/UwUpp/"
license=('BSD')
groups=()
depends=(stack)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/Deltaphish/UwUpp.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/UwUpp"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/UwUpp"
  stack build
}

package() {
    cd "$srcdir/UwUpp"
    stack install
    # Rename output binary
    cd $(stack path --local-bin)
    if test -f "./UwUpp-exe"; then
        mv ./UwUpp-exe ./uwupp
        echo -e "\n\n\e[1;33mBinary has been renamed to \"uwupp\".\e[0m\n\n"
    fi # If the file doesn't exist, just ignore it
}
makesrcinfo() {
    makepkg --printsrcinfo > .SRCINFO
}
