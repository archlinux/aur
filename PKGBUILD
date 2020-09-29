# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=XTuner
pkgname="${_projectname,,}"
pkgver=1.0
pkgrel=1
pkgdesc="An instrument tuner for JACK"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_projectname}"
license=('GPL2')
depends=('cairo')
makedepends=('jack' 'liblo' 'libsigc++' 'zita-resampler')
optdepends=('new-session-manager: for NSM support')
groups=('pro-audio')
source=(
    "https://github.com/brummer10/${_projectname}/releases/download/v${pkgver}/${_projectname}_${pkgver}.tar.gz"
)
sha256sums=('9da772b5dab2e5e87be79c2558b29174fed6228cb28ae961b5f62b41a75f7185')


build() {
  cd "${srcdir}/${_projectname}_${pkgver}"
  LDFLAGS="$LDFLAGS -z noexecstack" make
}

package() {
  depends+=('libfftw3f.so' 'libjack.so' 'liblo.so' 'libsigc++' 'libzita-resampler.so')
  cd "${srcdir}/${_projectname}_${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
