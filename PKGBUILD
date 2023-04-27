pkgname='alsa-scarlett-gui-git'
_pkgname='alsa-scarlett-gui'
pkgver=0.2.7.g65c0
pkgrel=1
pkgdesc="Gtk4 GUI for the Focusrite Scarlett Gen 2/3 ALSA Mixer Driver."
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/alsa-scarlett-gui"
license=('GPL3')
depends=('gtk4' 'alsa-lib')
makedepends=('gcc' 'make' 'git' 'pkgconf' 'sed')
provides=('alsa-scarlett-gui')
source=( "$_pkgname::git+https://github.com/geoffreybennett/alsa-scarlett-gui.git")
sha384sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --abbrev=4 --always --tags | sed 's/-/./g')"
}

build() {
    cd $_pkgname
    sed -i 's/-Werror//' src/Makefile
    PREFIX="/usr" make -C src
 }

package() {
    cd "$srcdir/$_pkgname"
    PREFIX="${pkgdir}/usr" make -C src install
}
