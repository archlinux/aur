pkgname=xmlada
pkgver=2017
pkgrel=1

pkgdesc='xml parsing and schema based validation'
url='http://libre.adacore.com/tools/xmlada/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada')
makedepends=('git' 'gprbuild-bootstrap')

provides=('xmlada')
conflicts=('xmlada')

source=('git+https://github.com/AdaCore/xmlada'
        'expose-cargs-and-largs-makefile.patch')

sha1sums=('SKIP'
          '9b65cc99453fd15bdb7c49a32e6f76922ec904bd')


pkgver() {
    cd xmlada
    git describe | sed 's/^xmlada-//; s/-/.r/; s/-/./'
}


prepare() {
    cd xmlada
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch
}


build() {
    cd xmlada
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared
    make PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R
}


package() {
    cd xmlada
    make prefix="$pkgdir"/usr install
}
