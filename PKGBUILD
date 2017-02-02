# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=lily
pkgver=1.0
pkgrel=0
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://fascinatedbox.github.io/lily/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('lily')
conflicts=('lily')
source=("lily-${pkgver}.tar.gz::https://github.com/fascinatedbox/lily/archive/v${pkgver}.tar.gz")
sha256sums=('6ea719ba3ae3b677b44ca25281ac7bf63f3241b4e6faef6d6bfc794993e292bd')

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
