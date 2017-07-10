# Maintainer: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.81.095
pkgrel=3
epoch=1
pkgdesc='Comskip is a free MPEG commercial break detector'.
_gitname='comskip'
url='http://github.com/erikkaashoek/Comskip'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git')
depends=('ffmpeg' 'argtable')
source=("${_gitname}::git+https://github.com/erikkaashoek/Comskip#commit=0bf473cb5be4b754f01f95fb3cffd120f5f1985a"
        "comskip-version.patch")
sha256sums=('SKIP'
            '79e992be77b0408dfe8651022f9784bf02336326b0ec4cc636ac2ebed690e134')

prepare() {
  cd "${srcdir}/${_gitname}"
  # Fixes version reported by binary.
  patch -Np1 -i $srcdir/comskip-version.patch
}


build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make clean
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/${_gitname}/comskip" "$pkgdir/usr/bin/comskip"
  if [ -e "${srcdir}/${_gitname}/comskip-gui" ]; then
    install -m755 "${srcdir}/${_gitname}/comskip-gui" "$pkgdir/usr/bin/comskip-gui"
  fi
}

# vim:set ts=2 sw=2 et:
