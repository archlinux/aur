# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
_pkgname=libva-utils
pkgver=2.2.0
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for headless libva"
arch=('x86_64')
url="https://github.com/01org/libva-utils"
license=('custom')
depends=('libva-headless')
conflicts=('libva-utils')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('1c45452090456f2b972d51960b1294215615b0dd925aa36b90eceac77777f3e3')

build() {
    cd ${_pkgname}-${pkgver}
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-drm \
        --disable-x11 \
        --disable-wayland
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${_pkgname}/COPYING
}
