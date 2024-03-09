pkgname='alsa-scarlett-gui-dev'
_pkgname='alsa-scarlett-gui'
pkgver=0.3.3.116.g7f40565
pkgrel=1
pkgdesc="GUI for the ALSA controls presented by the Scarlett2 driver, Development version"
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/alsa-scarlett-gui"
license=('GPL-3.0-or-later OR LGPL-3.0-or-later')
depends=('alsa-lib' 'gtk4' 'openssl')
makedepends=('gcc' 'make' 'git' 'pkgconf' 'sed')
provides=('alsa-scarlett-gui')
source=("git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --always --tags | sed 's/-/./g')"
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
