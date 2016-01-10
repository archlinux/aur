# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=3.0
pkgrel=2
pkgdesc='A dynamic Python binding for the Qt framework to embed Python code into C++ Qt applications.'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
makedepends=('cmake')
depends=('qt4' 'python')
optdepends=('qtwebkit')
license=('LGPL')
source=("http://sourceforge.net/projects/pythonqt/files/pythonqt/PythonQt-3.0/PythonQt3.0.zip")
sha512sums=('8e2a964fcf4f73ddea46f7dc2bf67de97d2e161a2ab7d5c30d9db4b36fdc2295276845649d7bc99b085bc9c71d1fc9bb934833a2f0b1e5b0ef793cb8b4aa95b3')

build() {
  cd "$srcdir"
  rm -rf build
  mkdir build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DPythonQt_DEBUG:BOOL=OFF \
    -DPythonQt_Wrap_QtAll:BOOL=ON \
    -DPythonQt_Wrap_Qtcore:BOOL=ON \
    -DPythonQt_Wrap_Qtgui:BOOL=ON \
    -DPythonQt_Wrap_Qtnetwork:BOOL=ON \
    -DPythonQt_Wrap_Qtopengl:BOOL=ON \
    -DPythonQt_Wrap_Qtsql:BOOL=ON \
    -DPythonQt_Wrap_Qtsvg:BOOL=ON \
    -DPythonQt_Wrap_Qtuitools:BOOL=ON \
    -DPythonQt_Wrap_Qtwebkit:BOOL=ON \
    -DPythonQt_Wrap_Qtxml:BOOL=ON \
    -DPythonQt_Wrap_Qtxmlpatterns:BOOL=OFF \
    ../PythonQt"$pkgver"

    make
}

package() {
    cd "$srcdir"/build
    make DESTDIR=${pkgdir} install
}
