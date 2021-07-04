# Maintainer: Black_Codec <orso.f.regna@gmail.com>
# $Id: PKGBUILD 231195 2015-02-09 20:22:56Z eric $
# Original Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox-wm
_pkgname=fluxbox
pkgver=1.3.7
pkgrel=3
pkgdesc="Fluxbox window manager only: compiled without slit, toolbar and systemtray"
arch=('i686' 'x86_64')
url="http://www.fluxbox.org"
license=('MIT')
provides=('fluxbox')
conflicts=('fluxbox' 'fluxbox-noslit')
depends=('libxft' 'libxpm' 'libxinerama' 'libxrandr' 'imlib2' 'fribidi')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
        '0001-do-not-leave-stale-oplock-behind.patch'
        '0002-send-ConfigureNotify-using-root-coordinates.patch'
        '0003-c-plus-plus-17.patch'
        '0004-window-menu.patch')
sha256sums=('fc8c75fe94c54ed5a5dd3fd4a752109f8949d6df67a48e5b11a261403c382ec0'
            '9c486f454f46a51cb1b7cb65de812faa12e2a1cce13785c349b488f051a01470'
            '66f64c67e5c99b2c6bf139ba2f7a3ff9fcb613c5b49b0038c42cc55cc00153dc'
            'a743324fb0c684be44fbcb3ff626f604057fce42fe1dda774515c1b24efbf418'
            'b9a4cdc5637eb5c275a9de2f43dd13987233a2c2fa843deb9958127e04960ac2')

prepare() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ../0001-do-not-leave-stale-oplock-behind.patch
  patch -Np1 < ../0002-send-ConfigureNotify-using-root-coordinates.patch
  patch -Np1 < ../0003-c-plus-plus-17.patch
  patch -Np1 < ../0004-window-menu.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --enable-xft --enable-xinerama \
    --enable-imlib2 --enable-nls \
    --disable-slit \
    --disable-systray \
    --disable-toolbar
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
