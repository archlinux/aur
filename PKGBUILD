# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Marcel Röthke <marcel@roethke.info>
pkgname=rtrlib
pkgver=0.3.6
pkgrel=1
pkgdesc="RPKI-RTR client library"
arch=(x86_64)
url=""https://github.com/rtrlib/rtrlib
license=('MIT')
depends=()
makedepends=(cmake)
options=(strip)
source=("rtrlib-$pkgver.tar.gz::https://github.com/rtrlib/rtrlib/archive/v$pkgver.tar.gz")
#https://github.com/rtrlib/rtrlib/archive/v0.3.6.tar.gz
md5sums=(07912a1612b1e949f16e0f1c6474392c)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    echo $pkgname-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR:STRING=lib \
	  .
    make rtrlib
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
