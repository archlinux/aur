pkgname=mingw-w64-xorgproto
_name=xorgproto
pkgver=2018.4
pkgrel=1
pkgdesc="combined X.Org X11 Protocol headers (mingw-w64)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('mingw-w64-xorg-util-macros' 'mingw-w64-meson')
provides=('mingw-w64-bigreqsproto' 'mingw-w64-compositeproto' 'mingw-w64-damageproto' 'mingw-w64-dmxproto' 'mingw-w64-dri2proto' 'mingw-w64-dri3proto' 'mingw-w64-fixesproto' 'mingw-w64-fontsproto' 'mingw-w64-glproto' 'mingw-w64-inputproto' 'mingw-w64-kbproto' 'mingw-w64-presentproto' 'mingw-w64-printproto' 'mingw-w64-randrproto' 'mingw-w64-recordproto' 'mingw-w64-renderproto' 'mingw-w64-resourceproto' 'mingw-w64-scrnsaverproto' 'mingw-w64-videoproto' 'mingw-w64-xcmiscproto' 'mingw-w64-xextproto' 'mingw-w64-xf86dgaproto' 'mingw-w64-xf86driproto' 'mingw-w64-xf86miscproto' 'mingw-w64-xf86vidmodeproto' 'mingw-w64-xineramaproto' 'mingw-w64-xproto')
conflicts=('mingw-w64-bigreqsproto' 'mingw-w64-compositeproto' 'mingw-w64-damageproto' 'mingw-w64-dmxproto' 'mingw-w64-dri2proto' 'mingw-w64-dri3proto' 'mingw-w64-fixesproto' 'mingw-w64-fontsproto' 'mingw-w64-glproto' 'mingw-w64-inputproto' 'mingw-w64-kbproto' 'mingw-w64-presentproto' 'mingw-w64-printproto' 'mingw-w64-randrproto' 'mingw-w64-recordproto' 'mingw-w64-renderproto' 'mingw-w64-resourceproto' 'mingw-w64-scrnsaverproto' 'mingw-w64-videoproto' 'mingw-w64-xcmiscproto' 'mingw-w64-xextproto' 'mingw-w64-xf86dgaproto' 'mingw-w64-xf86driproto' 'mingw-w64-xf86miscproto' 'mingw-w64-xf86vidmodeproto' 'mingw-w64-xineramaproto' 'mingw-w64-xproto')
replaces=('mingw-w64-bigreqsproto' 'mingw-w64-compositeproto' 'mingw-w64-damageproto' 'mingw-w64-dmxproto' 'mingw-w64-dri2proto' 'mingw-w64-dri3proto' 'mingw-w64-fixesproto' 'mingw-w64-fontsproto' 'mingw-w64-glproto' 'mingw-w64-inputproto' 'mingw-w64-kbproto' 'mingw-w64-presentproto' 'mingw-w64-printproto' 'mingw-w64-randrproto' 'mingw-w64-recordproto' 'mingw-w64-renderproto' 'mingw-w64-resourceproto' 'mingw-w64-scrnsaverproto' 'mingw-w64-videoproto' 'mingw-w64-xcmiscproto' 'mingw-w64-xextproto' 'mingw-w64-xf86dgaproto' 'mingw-w64-xf86driproto' 'mingw-w64-xf86miscproto' 'mingw-w64-xf86vidmodeproto' 'mingw-w64-xineramaproto' 'mingw-w64-xproto')
options=('staticlibs' '!buildflags' '!strip')
source=(https://xorg.freedesktop.org/archive/individual/proto/$_name-$pkgver.tar.bz2{,.sig}
        meson.patch)
sha512sums=('2db682d10280ca58cdc04d8eb9fef30c111d4cd379de9fec86cff317865b859a576de5426447be9231d24be9762cc1d684c57383a99ad499398e8b7d62b1c03c'
            'SKIP'
            'cec486d47dbea1fcb4338a849b71b69756a8c5bdd4dde16dd8ae963f70bf5231fee227970016a3ab9924934644e7c9c0ccba85c5d9c12caf0be124c3d2ffb645')
validpgpkeys=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2'  #  "Adam Jackson <ajax@nwnk.net>"
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'  # "Adam Jackson <ajax@benzedrine.nwnk.net>"
              'C383B778255613DFDB409D91DB221A6900000011') #  "Keith Packard <keithp@keithp.com>"

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -p1 -i "$srcdir/meson.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    ${_arch}-meson build-${_arch} \
      -Dlegacy=true

    ninja -C build-${_arch}
  done
}

package() {
  cd "$srcdir/$_name-$pkgver"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
  done
}
