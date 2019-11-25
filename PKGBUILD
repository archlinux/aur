# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=euterpe-git
_pkgname=euterpe
pkgver=r20.c114002
pkgrel=1
pkgdesc="Real-time Audio-to-audio Karaoke Generation System for Monaural Music"
arch=('i686' 'x86_64')
url="https://github.com/tachi-hi/euterpe"
license=('unknown')
makedepends=('git')
depends=('tcl' 'fftw' 'portaudio')
source=("${_pkgname}::git+https://github.com/tachi-hi/euterpe.git"
        "euterpe.sh")
md5sums=('SKIP'
         'a476435472c2cddc447242d8c9fa1e9d')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}/src
  make
}

package() {
  install -dm755 ${pkgdir}/usr/share/euterpe
  install -Dm755 $srcdir/${_pkgname}/src/euterpe ${pkgdir}/usr/share/euterpe/euterpe
  install -Dm644 $srcdir/${_pkgname}/TkTempoConv3.tcl ${pkgdir}/usr/share/euterpe/TkTempoConv3.tcl
  install -Dm644 $srcdir/${_pkgname}/README.md ${pkgdir}/usr/share/doc/euterpe/README.md
  install -Dm755 $srcdir/euterpe.sh ${pkgdir}/usr/bin/euterpe
}
