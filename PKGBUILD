pkgname=xmlada
pkgver=2017
pkgrel=3

pkgdesc='Xml parsing and schema based validation.'
url='http://libre.adacore.com/tools/xmlada/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada')
makedepends=('git' 'gprbuild-bootstrap')

provides=('xmlada')
conflicts=('xmlada')

source=('http://mirrors.cdn.adacore.com/art/591aeb88c7a4473fcbb154f8'
        'expose-cargs-and-largs-makefile.patch')

sha1sums=('SKIP'
          '9b65cc99453fd15bdb7c49a32e6f76922ec904bd')


prepare() {
    cd xmlada-gpl-2017-src
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch
}


build() {
    cd xmlada-gpl-2017-src
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared
    make
}


package() {
    cd xmlada-gpl-2017-src
    make prefix="$pkgdir"/usr install
}
