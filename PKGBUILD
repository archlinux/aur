pkgname=mingw-w64-fluidsynth-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (mingw-w64)"
arch=('any')
url="http://www.fluidsynth.org/"
license=("GPL")
depends=('mingw-w64-glib2'
  'mingw-w64-libsndfile'
  'mingw-w64-portaudio'
  'mingw-w64-readline')
options=('strip' 'staticlibs')
provides=('mingw-w64-fluidsynth')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-fluidsynth-2.1.2-1-any.pkg.tar.xz")
sha256sums=('SKIP')

_architectures="x86_64-w64-mingw32"

package() {
  cd "${srcdir}/mingw64"
  for _arch in ${_architectures}; do
    mkdir -p ./* $pkgdir/usr/${_arch}/
    chmod +x ./lib/libfluidsynth.dll.a
    cp -r ./* $pkgdir/usr/${_arch}/
    sed -i -e "s|/mingw64|/usr/${_arch}|" $pkgdir/usr/${_arch}/lib/pkgconfig/fluidsynth.pc
  done
}
