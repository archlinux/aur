# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

pkgname=carla
pkgver=1.2.4
pkgrel=4
pkgdesc="Audio Plugin Host"
arch=('i686' 'x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
depends=('fftw' 'fluidsynth' 'liblo' 'libsmf' 'linuxsampler' 'mxml' 'ntk-git' 'python' 'qt4' 'zlib')
makedepends=('gtk2' 'gtk3' 'pygtk' 'python-pyliblo' 'python-pyqt4' 'python-rdflib' 'qt5-base' 'zynaddsubfx')
optdepends=(
  'gtk2: LV2 GTK2 UI support'
  'gtk3: LV2 GTK3 UI support'
  'pygtk: NekoFilter UI'
  'python-pyliblo: Carla-Control'
  'python-rdflib: LADSPA-RDF support'
  'qt5-base: LV2 UI support'
  'zynaddsubfx: ZynAddSubFX banks'
)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://downloads.sourceforge.net/project/kxstudio/Releases/${pkgname}/Carla-${pkgver}-src.tar.bz2"
        "gcc6.patch")
sha512sums=('bc0fd43cc2237abafc5676d1e0a002d0d85ccdf588d681f6f9e63fd4af99125de2dd31c442ae55b17d2ebfc732dfbeaf238f4cab018e100c2e76df719298fe51'
            '8d76bc717f10f8bca22391a31d76ab97f46cf6bf586154d472c532863a562c71f79811ff6432e8923e30807b263f2135531216da04e53ae45b355dc339b03c21')

prepare() {
  cp gcc6.patch Carla-${pkgver}
  cd "Carla-${pkgver}"
  patch -Np1 -i ${srcdir}/gcc6.patch
}

build() {
  cd "Carla-${pkgver}"
  make
}

package() {
  cd "Carla-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
}
