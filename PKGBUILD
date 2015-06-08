# Maintainer: Corentin Delcourt <aur@codl.fr>

pkgname=autocutsel-git
pkgver=0.10.0
pkgrel=1
pkgdesc="Synchronizes the two copy/paste buffers mainly used by X applications"
arch=(i686 x86_64)
url='http://www.nongnu.org/autocutsel/'
install=autocutsel.install
depends=('libxaw')
license=('GPL')
provides=('autocutsel')
conflicts=('autocutsel')
source=("${pkgname}"::'git+https://github.com/sigmike/autocutsel.git'
        'autocutsel.install')
md5sums=('SKIP'
         'd5616ff1b64c78473c02a4d8c88675bd')


pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make prefix="${pkgdir}/usr" install
}
