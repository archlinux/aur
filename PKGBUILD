# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=xbps
pkgver=0.59.1
pkgrel=1
pkgdesc="The X Binary Package System from Void Linux. Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="https://github.com/void-linux/xbps"
license=('BSD')
depends=('ca-certificates' 'libarchive' 'openssl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0cbd8d5f23a62047c75974bca21da9f004a94efffd7f37c68562a8dbc869fb2a')

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
