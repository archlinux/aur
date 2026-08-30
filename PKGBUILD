# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=dream-nox
_pkgname=dream
pkgver=2.2.4
pkgrel=4
pkgdesc="A software radio for AM and Digital Radio Mondiale (DRM), w/o GUI"
arch=(i686 x86_64 aarch64)
url="https://github.com/wwek/dream"
makedepends=('git')
license=('GPL-2.0-or-later')
depends=(libfdk-aac faad2 libpulse fftw opus libsndfile speexdsp hamlib libpcap qt5-base 'faac>=1.31')
provides=('dream')
conflicts=('dream')

source=("$_pkgname"::"git+https://github.com/wwek/${_pkgname}#tag=v${pkgver}")
sha256sums=('5830ec297aa0c7e725e72b1b3ff49218acf0840dce756adc58246b122305ab6d')

build() {
    cd "${srcdir}/${_pkgname}"

    qmake-qt5 CONFIG+=qtconsole CONFIG+=fdk-aac OUT_PWD="/usr/" dream.pro
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make INSTALL_ROOT=${pkgdir} install
}
