# Maintainer: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip
pkgver=0.82.009
pkgrel=1
epoch=1
pkgdesc='Comskip is a free MPEG commercial break detector'.
_gitname='comskip'
url='http://github.com/erikkaashoek/Comskip'
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('git')
depends=('ffmpeg' 'argtable')
source=("https://github.com/erikkaashoek/Comskip/archive/0.82.009.tar.gz")
sha256sums=('eae287eff75f018d71a92623ffa67529f8dc75fd6165d07f1b299cdf10c2981a')


build() {
  cd "${srcdir}/Comskip-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
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
