# Maintainer: vtyulb <vtyulb@vtyulb.ru>

pkgname=kumir2-git
pkgver=19.03.2015
pkgrel=2
pkgdesc="An educational programming language and IDE in Russian schools"
url="http://lpm.org.ru/kumir"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt4')
replaces=("kumir")

build() {
  cd "${srcdir}"
  git clone https://gitorious.org/kumir2/kumir2.git
  cd "${srcdir}/kumir2"
  cd src/plugins
  cat CMakeLists.txt | grep -v "llvmcodegenerator" > CMakeLists1
  mv CMakeLists1 CMakeLists.txt
  cd ../..
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" ../
  make
}

package() {
  cd "${srcdir}/kumir2/build"
  make install  
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}
