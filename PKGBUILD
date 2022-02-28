# Maintainer: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.82.009
pkgrel=3
epoch=1
pkgdesc='Comskip is a free MPEG commercial break detector'.
_gitname='comskip'
url='http://github.com/erikkaashoek/Comskip'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git')
depends=('ffmpeg4.4' 'argtable')
source=("https://github.com/erikkaashoek/Comskip/archive/0.82.009.tar.gz"
        "compilation.patch")
sha256sums=('eae287eff75f018d71a92623ffa67529f8dc75fd6165d07f1b299cdf10c2981a'
            "5ea83b9e7189b9f320e3890891c0273daa5325b35298a3b921a904e9a357b798")

prepare() {
  patch -p1 -i ${srcdir}/compilation.patch
}

build() {
  cd "${srcdir}/Comskip-${pkgver}"
  ./autogen.sh
  PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig/ ./configure --prefix=/usr
  make clean
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/Comskip-${pkgver}/comskip" "$pkgdir/usr/bin/comskip"
  if [ -e "${srcdir}/Comskip-${pkgver}/comskip-gui" ]; then
    install -m755 "${srcdir}/Comskip-${pkgver}/comskip-gui" "$pkgdir/usr/bin/comskip-gui"
  fi
}

# vim:set ts=2 sw=2 et:
