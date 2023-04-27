pkgname='alsa-scarlett-gui-git'
_pkgname='alsa-scarlett-gui'
pkgver=0.2.7.g65c0
pkgrel=1
pkgdesc="Gtk4 GUI for the Focusrite Scarlett Gen 2/3 ALSA Mixer Driver."
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/alsa-scarlett-gui"
license=('GPL3')
depends=('gtk4' 'alsa-lib')
makedepends=('gcc' 'make' 'git' 'pkgconf')
provides=('alsa-scarlett-gui')
source=(
    "$_pkgname::git+https://github.com/geoffreybennett/alsa-scarlett-gui.git"
    "werror.patch"
    )
sha384sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --abbrev=4 --always --tags | sed 's/-/./g')"
}

build() {
    patch "$_pkgname/src/Makefile" werror.patch
    cd $_pkgname
    PREFIX="/usr" make -C src
 }

package() {
    cd "$srcdir/$_pkgname"
    PREFIX="${pkgdir}/usr" make -C src install
}
