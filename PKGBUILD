# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=lily
pkgver=1.1
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="http://lily-lang.org/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fascinatedbox/lily/archive/v${pkgver}.tar.gz")
sha256sums=('8d243707c8ee796d492644235134da0edb6b29231f06c568824e1e424e74b64f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
