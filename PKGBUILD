# Maintainer: zoe <aur at fully dot automated dot ee ignore the everything after ee>
pkgname=ktechlab
pkgver=0.40.1
pkgrel=1
pkgdesc="KTechLab is an IDE for microcontrollers and electronics. It supports circuit simulation, program development for microcontrollers and simulating the programmed microcontroller together with its application circuit."
arch=('x86_64' 'i686')
url="https://github.com/ktechlab/ktechlab"
license=('GPL')
#options=(!makeflags)
depends=('qt4' 'kdelibs')
makedepends=('git' 'cmake' 'gcc' 'gendesk' 'automoc4')
source=(https://codeload.github.com/ktechlab/ktechlab/tar.gz/v0.40.1
    )
md5sums=('bdfe559bc98131a569cb64d497810999')

build() {
  cd ktechlab-$pkgver
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=debugfull
        UI_HEADERS_TO_GENERATE="
        ./src/gui/ui_contexthelpwidget.h
        ./src/gui/ui_generaloptionswidget.h
        ./src/gui/ui_linkeroptionswidget.h
        ./src/gui/ui_processingoptionswidget.h
        ./src/gui/ui_programmerwidget.h
        ./src/gui/ui_gpasmsettingswidget.h
        ./src/gui/ui_newprojectwidget.h
        ./src/gui/ui_newfilewidget.h
        ./src/gui/ui_outputmethodwidget.h
        ./src/gui/ui_scopescreenwidget.h
        ./src/gui/ui_createsubprojectwidget.h
        ./src/gui/ui_asmformattingwidget.h
        ./src/gui/ui_oscilloscopewidget.h
        ./src/gui/ui_microsettingswidget.h
        ./src/gui/ui_newpinmappingwidget.h
        ./src/gui/ui_logicwidget.h
        ./src/gui/ui_sdccoptionswidget.h
        ./src/gui/ui_picprogrammerconfigwidget.h
        ./src/gui/ui_gplinksettingswidget.h
        "
    for HEADER in $UI_HEADERS_TO_GENERATE ; do
        make -f src/gui/CMakeFiles/gui.dir/build.make "$HEADER"
    done

  make
}

package() {
  cd $srcdir/ktechlab-$pkgver/build
  make DESTDIR="$pkgdir" install
  install -d $pkgdir/usr/share/pixmaps
  install -m664 $srcdir/ktechlab-$pkgver/icons/hi128-app-ktechlab.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
} 
