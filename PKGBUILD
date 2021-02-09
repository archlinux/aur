# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=libqalculate-git
_pkgname="${pkgname%-git}"
pkgver=r744.0262019
pkgrel=1
pkgdesc="Multi-purpose desktop calculator"
arch=('x86_64')
url="https://qalculate.github.io/"
license=('GPL')
depends=('libxml2' 'curl' 'mpfr')
makedepends=('intltool' 'doxygen' 'git')
optdepends=('gnuplot: for plotting support')
conflicts=('libqalculate')
provides=('libqalculate')
source=('git+https://github.com/Qalculate/libqalculate.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    ./autogen.sh
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
