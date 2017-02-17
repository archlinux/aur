# Maintainer: vtyulb <vtyulb@vtyulb.ru>

pkgname=kumir2-git
pkgver=17.02.2017
pkgrel=1
pkgdesc="An educational programming language and IDE in Russian schools"
url="http://lpm.org.ru/kumir"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('git' 'cmake' 'python')
depends=('qt4')
replaces=("kumir")

build() {
  cd "${srcdir}"
  git clone https://github.com/victor-yacovlev/kumir2.git
  cd "${srcdir}/kumir2"
  cd src/plugins
  cat CMakeLists.txt | grep -v "llvmcodegenerator" > CMakeLists1
  mv CMakeLists1 CMakeLists.txt
  cd ../..
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ../
  make
}

package() {
  cd "${srcdir}/kumir2/build"
  make install  
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib" | true
}
