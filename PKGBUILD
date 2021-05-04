# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgbase=calligra-git
pkgname=('calligra-git')
pkgver=3.2.1.r214.g92f10c7bd1d
pkgrel=1
pkgdesc="office and graphic art suite by KDE"
arch=("$CARCH")
license=('FDL1.2' 'GPL2' 'LGPL')
url='http://www.calligra-suite.org/'
makedepends=('git' 'vc' 'libgit2' 'extra-cmake-modules' 'kdesignerplugin' 'kdoctools' 'kdelibs4support' 'cmake' 'khtml' 'kross'
             'kreport' 'kproperty' 'kdiagram' 'okular' 'kxmlgui' 'qt5-webkit' 'poppler' 'qca-qt5' 'libvisio' 'ninja'
             'libetonyek' 'kactivities' 'kio' 'openexr' 'lcms2'  'kxmlgui' 'marble'
             'kcalcore' 'akonadi-contacts' 'knotifyconfig' 'poppler-qt5' 'libodfgen' 'threadweaver' 'boost' 'eigen' 'kinit' 'libwps')
depends=('kcmutils'  'knotifyconfig' 'kross' 'kactivities' 'okular'
         'kdiagram' 'libspnav' 'kdelibs4support' 'gsl' 'openexr' 'kcontacts' 'qca-qt5'
               'poppler-qt5' 'libodfgen' 'qt5-webkit'
               'cauchy' 'khtml' 'qt5-declarative')
optdepends=('libwpg: Corel WordPerfect Graphics image importer'
            'libwps: Microsoft Works file word processor format import'
            'libvisio: Microsoft Visio import filter'
            'libetonyek: Apple Keynote import filter'
            'pstoedit: EPS to SVG filter'
            'poppler: PDF to SVG filter'
            'openjpeg: PDF to SVG filer'
            'libgit2: Calligra Gemini git plugin'
            'kirigami2: for Calligra Gemini'
            'qt5-quickcontrols: for Calligra Gemini'
            'qt5-webengine: for Calligra Gemini')
source=('calligra::git+https://invent.kde.org/office/calligra.git')
sha256sums=('SKIP')
conflicts=(calligra calligra-devtools-git calligra-extras-git calligra-filters-git calligra-karbon-git karbon calligra-libs-git
  calligra-plugins-git calligra-sheets-git calligra-stage-git calligra-words-git calligra-meta
  calligra-flow-git calligra-braindump-git calligra-gemin-git calligra-handbook-git)
replaces=(calligra calligra-devtools calligra-extras calligra-filters calligra-karbon karbon calligra-libs
  calligra-plugins calligra-sheets calligra-stage calligra-words calligra-l10n calligra-meta)
provides=('calligra')

pkgver() {
  cd calligra
   git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

   if [[ "${CARCH}" == "i686" ]]; then
     CFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
     CXXFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
   else
     CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
     CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
   fi

  cmake -B build \
  -S calligra -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=debugfull \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_TESTING=OFF  -Wno-dev
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

