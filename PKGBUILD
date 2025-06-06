# Maintainer: Thomas Adam <thomas@fvwm.org>
# Maintainer: boonpatrol
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=fvwm3
pkgver=1.1.3
pkgrel=1
pkgdesc="A highly customizable virtual desktop window manager with small memory footprint."
arch=('x86_64')
url="https://www.fvwm.org"
license=('GPL' 'custom')
depends=('libevent' 'libx11' 'libxft' 'libxkbcommon' 'libxrender' 'libxt' 'python' 'libxrandr' 'xtrans' )
provides=('fvwm=3')
conflicts=('fvwm')
makedepends=('cmake' 'meson' 'libxslt' 'asciidoctor')
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
sha256sums=('3377bf7ecb2ad4fdbe4e9efde328c3a794894db66f670b9d2b7f03a0010c5de5'
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
