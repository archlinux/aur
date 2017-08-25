# Maintainer: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.82.002
pkgrel=1
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
            '7bf06bef3c4d26b6aad1bd0714b2b365bbd0c76bb491bf8ec42d8752ff442cd0')

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
