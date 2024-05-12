# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=pascha-cli-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgver=2.0.r4.g419822c
pkgrel=1

pkgdesc="A simple CLI program to calculate and display the date of Pascha (Easter)"
arch=('any')
url="https://gitlab.com/cmmescher/pascha-cli.git"
license=('GPL3')
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-cli-git}")
conflicts=("${pkgname%-cli-git}")
source=("git+$url")
md5sums=('SKIP')

build() {
    cmake -B build -S "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
