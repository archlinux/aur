# Maintainer: Thomas Adam <thomas@fvwm.org>
# Maintainer: boonpatrol
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=fvwm3
pkgver=1.1.2
pkgrel=1
pkgdesc="A highly customizable virtual desktop window manager with small memory footprint."
arch=('x86_64')
url="https://www.fvwm.org"
license=('GPL' 'custom')
depends=('libevent' 'libx11' 'libxft' 'libxkbcommon' 'libxrender' 'libxt' 'python' 'libxrandr' 'xtrans' )
provides=('fvwm=3')
conflicts=('fvwm')
makedepends=('meson' 'libxslt' 'asciidoctor')
optdepends=('fontconfig'
            'freetype2'
            'fribidi'
            'ncurses'
            'libpng'
            'readline'
            'librsvg'
            'libsm'
            'libxcursor'
            'libxext'
            'libxi'
            'libxpm'
            'sharutils' )
options=('!emptydirs' '!makeflags')
source=("https://github.com/fvwmorg/fvwm3/releases/download/${pkgver}/fvwm3-${pkgver}.tar.gz" 'fvwm3.desktop')
sha256sums=('ecdcf1099bac3e7b1198bdee7542150d378ee333a644c49095e974d819b8d1c3'
            'e18c21b37219328309ac97b0026778299fc5db8d4aec3a4610287d92cec260db')

build() {
  #cd "${pkgname}-${pkgver}"
  arch-meson ${pkgname}-${pkgver} build -Dmandoc=true
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/doc/fvwm3"
  install -D -m644 ../fvwm3.desktop "${pkgdir}/usr/share/xsessions/fvwm3.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
