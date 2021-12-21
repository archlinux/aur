# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=dream
pkgver=2.1.1
pkgrel=3
pkgdesc="A software radio for AM and Digital Radio Mondiale (DRM)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/drm"
license=(GPL2)
depends=(faad2 libpcap libpulse fftw opus libsndfile speexdsp hamlib libpulse qwt qt5-webkit qt5-svg qt5-base)
makedepends=(gcc patch)
source=("https://sourceforge.net/projects/drm/files/dream/${pkgver}/${pkgname}-${pkgver}-svn808.tar.gz"
        "fix_qwttext.patch")
sha256sums=('417734a197ed596a08e75363c304be9b4595f2f21581bc64fec47c49f733bb05'
            'a5c521644f9a95f73adc4eefa8bb690642caefa59b028ddd9b34aea231af96f2')

build() {
    cd "${srcdir}/${pkgname}"

    patch -Np0 -i "${srcdir}/fix_qwttext.patch"

    qmake-qt5 dream.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make INSTALL_ROOT=${pkgdir} install
}
