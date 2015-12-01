_pkgname=gtkevemon
_gitname=gtkevemon

pkgname=$_pkgname-git
pkgver=r228.f38c0e8
pkgrel=1
pkgdesc="EVE Online skill monitor"
arch=('i686' 'x86_64')
url="https://github.com/gtkevemon/gtkevemon/"
license=('GPL3')
depends=('gtkmm3' 'libxml2' 'openssl')
makedepends=('git')
provides=('gtkevemon')
source=(
    "git+https://github.com/gtkevemon/$_gitname/"
    makefile.patch
    )
sha256sums=(
    'SKIP'
    'b8d42a5d59888c1a78fa4f80574fa3c6670ab8c665b931494fdc4d2e0f400791'
    )

pkgver() {
    cd "${srcdir}/gtkevemon/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/gtkevemon/"
    patch -Np1 -i ../makefile.patch
    printf 'Done patching makefile\n\n'
}

build() {
    cd "${srcdir}/gtkevemon/"
    make
}

package() {
    cd "${srcdir}/gtkevemon/"
    make PREFIX=$pkgdir/usr install
}
