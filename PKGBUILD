# Maintainer: killruana <killruana@gmail.com>
pkgname=qrouter
pkgver=1.2.35
pkgrel=2
epoch=
pkgdesc='Multi-level, over-the-cell maze router'
arch=('i686' 'x86_64')
url='http://opencircuitdesign.com/qrouter/'
license=('GPL')
depends=('tk')
source=("${url}/archive/${pkgname}-${pkgver}.tgz"
        "${pkgname}.patch")
sha512sums=('0f484ea3c19019730805beefbf9e97cceceaba8c662413a63f6d234c7f90853015504d4e456be77016d92325d1ffd1041d677519d6c2332ed5f6ab3ba2fdaeb7'
            '1b545556fb8d4f3153c63caf7142419d98d009faaacb0d354269eda10847d126140a872c12c4d19fc9bbb52c83c2fa1750837a9aacd8c9aa0a6fcdc5bbd94d97')


prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    patch -Np1 -i "${srcdir}/${pkgname}.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoconf -v
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
