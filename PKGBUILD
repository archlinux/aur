# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fvwm
pkgver=2.6.9
pkgrel=3
pkgdesc="A multiple large virtual desktop window manager originally derived from twm"
arch=('x86_64')
url="http://www.fvwm.org"
license=('GPL' 'custom')
depends=('fribidi' 'perl' 'libstroke' 'libxpm' 'librsvg' 'libxinerama' 'libxcursor' 'python-xdg')
makedepends=('libxslt')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support')
options=('!emptydirs' '!makeflags')
source=(https://github.com/fvwmorg/fvwm/releases/download/${pkgver}/fvwm-${pkgver}.tar.gz fvwm.desktop)
sha256sums=('1bc64cf3ccd0073008758168327a8265b8059def9b239b451d6b9fab2cc391ae'
            '51d345f995f57c6d881d48bf535f71d75041a9bf1f0fa41dd99e1b22fd66aaf3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-stroke-library --enable-mandoc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
