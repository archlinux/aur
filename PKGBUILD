# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=dream-nox
_pkgname=dream
pkgver=2.1.1
pkgrel=1
pkgdesc="A software radio for AM and Digital Radio Mondiale (DRM), w/o GUI"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/drm"
license=(GPL2)
depends=(faad2 libpulse fftw opus libsndfile speexdsp hamlib libpulse qt5-base faac-drm)
makedepends=(patch)
provides=('dream')
conflicts=('dream')

source=("https://sourceforge.net/projects/drm/files/dream/${pkgver}/${_pkgname}-${pkgver}-svn808.tar.gz"
        "fix_qwttext.patch"
        "fix_hamlib.patch")
sha256sums=('417734a197ed596a08e75363c304be9b4595f2f21581bc64fec47c49f733bb05'
            'a5c521644f9a95f73adc4eefa8bb690642caefa59b028ddd9b34aea231af96f2'
            'df8dbc1f5c2e6e181377bf7832dbf057018dd1be2b9cdfa8d9a24db3f0f9b76a')

build() {
  cd "${srcdir}/${_pkgname}"

  patch -Np0 -i "${srcdir}/fix_qwttext.patch"
  patch -Np0 -i "${srcdir}/fix_hamlib.patch"

  qmake-qt5 CONFIG+=qtconsole OUT_PWD="/usr/" dream.pro
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make INSTALL_ROOT=${pkgdir} install
}
