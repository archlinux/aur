pkgname=polaric-connect
pkgver=r4.4be4173
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Utility for connect Polaric web platform to raspberry"
license=('GPL')
url="https://www.polaricsemi.com"
makedepends=('git')
depends=('libssh' 'gtk3')
provides=('polaric-connect')
conflicts=('polaric-connect')
source=("git+https://github.com/NikitaLavrinenko/Polaric-Connect.git")
sha256sums=('SKIP')

pkgver() {
    cd "Polaric-Connect"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "Polaric-Connect"
    make
}

package() {
    cd "Polaric-Connect"
    make install DESTDIR="$pkgdir"
}
