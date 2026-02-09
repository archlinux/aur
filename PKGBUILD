# Maintainer: Kim Larsson <kim@cunimb.org>

pkgname=xbps
pkgver=0.60.7
pkgrel=1
pkgdesc="The X Binary Package System from Void Linux. Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="https://github.com/void-linux/xbps"
license=('BSD')
depends=('ca-certificates' 'libarchive' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ec8c2e4d595863b5748c10d9ada1d51ac1da6f910a9d31682acd1a477310c64e')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc

    sed -i '/-Werror/d' config.mk
    make
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 LICENSE.3RDPARTY "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.3RDPARTY
}
