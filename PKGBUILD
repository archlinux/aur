# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=dream-nox
_pkgname=dream
pkgver=2.2.4
pkgrel=1
pkgdesc="A software radio for AM and Digital Radio Mondiale (DRM), w/o GUI"
arch=(i686 x86_64 aarch64)
url="https://github.com/wwek/dream"
license=(GPL2)
depends=(libfdk-aac faad2 libpulse fftw opus libsndfile speexdsp hamlib libpulse qt5-base 'faac>=1.31')
provides=('dream')
conflicts=('dream')

source=("$_pkgname"::"git+https://github.com/wwek/${_pkgname}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"

    qmake-qt5 CONFIG+=qtconsole CONFIG+=fdk-aac OUT_PWD="/usr/" dream.pro
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make INSTALL_ROOT=${pkgdir} install
}
