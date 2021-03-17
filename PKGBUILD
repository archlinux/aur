# Maintainer: zoe <chp321@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=kmidimon
pkgver=1.0.0
pkgrel=1
pkgdesc="Drumstick MIDI Monitor (kmidimon) is a MIDI monitor for Linux using ALSA sequencer and Qt5 user interface."
arch=('i686' 'x86_64')
url="http://kmidimon.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'drumstick')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e245aaa7e6be47c6f5980ff610eaca97')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #####tar -xf ../drumstick.tar.gz
    
  #sed -i '/KDE4Defaults/ a INCLUDE(${QT_USE_FILE})\n MESSAGE("QT_USE_FILE: ${QT_USE_FILE}")' CMakeLists.txt

  # doc build errors prevent success
  #####sed -i '/doc/d' CMakeLists.txt
  
  # Compile code with -fPIC (build code with Position Independent Code)
  #sed -i '/-DQT_STRICT_ITERATORS/ a ADD_DEFINITIONS(-fPIC)' CMakeLists.txt
  #####sed -i '/CMAKE_MINIMUM_REQUIRED/ a SET(CMAKE_CXX_FLAGS "-fPIC")' CMakeLists.txt
  
  #sed -i 's/OPTION(ENABLE_PCH       "Enable precompiled headers" OFF)/OPTION(ENABLE_PCH       "Enable precompiled headers" ON)/' CMakeLists.txt
  #####sed -i 's/OPTION(STATIC_DRUMSTICK "Build drumstick static library" OFF)/OPTION(STATIC_DRUMSTICK "Build drumstick static library" ON)/' CMakeLists.txt
  
  # delete target that makes error in build (bug in Cmake) :
  #sed -i 's/ADD_CUSTOM_TARGET(uninstall/#ADD_CUSTOM_TARGET(uninstall/' CMakeLists.txt
  #sed -i 's|"${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")|#"${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")|' CMakeLists.txt

  # avoid bug in Cmake :
  #####sed -i '22i\cmake_policy(SET CMP0002 OLD)' CMakeLists.txt
  
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
          
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
