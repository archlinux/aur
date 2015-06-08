# Maintainer: Black_Codec <orso.f.regna@gmail.com>
# $Id: PKGBUILD 231195 2015-02-09 20:22:56Z eric $
# Original Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox-noslit
_pkgname=fluxbox
pkgver=1.3.7
pkgrel=1
pkgdesc="A lightweight and highly-configurable window manager compiled without the slit"
arch=('i686' 'x86_64')
url="http://www.fluxbox.org"
license=('MIT')
provides=('fluxbox')
conflicts=('fluxbox')
depends=('libxft' 'libxpm' 'libxinerama' 'libxrandr' 'imlib2' 'fribidi')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.xz
        fluxbox.desktop)
sha1sums=('c53940f5b70dfad39f4a3fa6b0e95072c2b3e9db'
          'f3f83b8ce84d79c2f8670ef687e0dd89ab0552b8')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --enable-xft --enable-xinerama \
    --enable-imlib2 --enable-nls \
    --disable-slit
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/fluxbox.desktop" "${pkgdir}/usr/share/xsessions/fluxbox.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
