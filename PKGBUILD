# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: cocreature <moritz.kiefer<at>purelyfunctional<dot>org>

pkgname=carla-git
pkgver=1.9.8.r54.gebd3f2e5
pkgrel=1
epoch=1
pkgdesc="Audio Plugin Host"
arch=("i686" "x86_64")
url="http://kxstudio.sf.net/carla"
license=("GPL2")
conflicts=("carla")
provides=("carla")
depends=(
    'ffmpeg'
    'fftw'
    'file'
    'fluidsynth'
    'liblo'
    'linuxsampler'
    'mxml'
    'ntk'
    'projectm'
    'python-pyqt5'
)
makedepends=(
    'fluidsynth'
    'git'
    'gtk2'
    'gtk3'
    'qt4'
)
optdepends=(
    'gtk2: LV2 GTK2 UI support'
    'gtk3: LV2 GTK3 UI support'
    'python-pyliblo: OSC control support'
    'python-rdflib: LADSPA-RDF support'
    'qt4: LV2 QT4 UI support'
    'zynaddsubfx: zynaddsubfx sound banks'
)
source=("$pkgname"::"git://github.com/falkTX/Carla.git")
md5sums=('SKIP')
changelog='changelog.txt'


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$pkgname"
  make \
    DEFAULT_QT=5 \
    MOC_QT5=/usr/bin/moc-qt5 \
    RCC_QT5=/usr/bin/rcc-qt5 \
    UIC_QT5=/usr/bin/uic-qt5
}

package() {
  cd "$srcdir/$pkgname"
  make \
    DEFAULT_QT=5 \
    MOC_QT5=/usr/bin/moc-qt5 \
    RCC_QT5=/usr/bin/rcc-qt5 \
    UIC_QT5=/usr/bin/uic-qt5 \
    DESTDIR="$pkgdir/" \
    PREFIX=/usr \
    install
}
