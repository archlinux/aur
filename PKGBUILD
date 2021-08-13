# Maintainer: boonpatrol

pkgname=fvwm3
pkgver=1.0.4
pkgrel=3
pkgdesc="A highly customizable virtual desktop window manager with small memory footprint."
arch=('x86_64')
url="https://www.fvwm.org"
license=('GPL' 'custom')
depends=('libevent' 'libx11' 'libxrender' 'libxt' )
makedepends=('libxslt')
optdepends=('asciidoctor'
            'fontconfig' 
            'freetype2' 
            'fribidi' 
            'ncurses' 
            'libpng' 
            'readline' 
            'librsvg' 
            'libsm' 
            'libxcursor'
            'libxext'
            'libxft'
            'libxi'
            'libxpm'
            'sharutils' )
options=('!emptydirs' '!makeflags')
source=("https://github.com/fvwmorg/fvwm3/releases/download/${pkgver}/fvwm3-${pkgver}.tar.gz" 'fvwm3.desktop')
sha256sums=('20877e20ae5ce39266e7d0ea48b013e822d600dd94f5b269955db05a3d50a63b' 
            'e18c21b37219328309ac97b0026778299fc5db8d4aec3a4610287d92cec260db')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --enable-mandoc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -d "${pkgdir}/usr/share/doc/fvwm3"
  install -D -m644 ../fvwm3.desktop "${pkgdir}/usr/share/xsessions/fvwm3.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
