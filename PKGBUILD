pkgname=libfirefly-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A standalone C++ Library for vectors calculations"
url="https://github.com/tbhaxor/firefly"
license=('GPL3')
arch=('any')
makedepends=('git')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')
example="EXAMPLE:

#include <firefly.hpp>
#include <iostream> // for io operations
#include <vector>  // for dynamic arrays :P
using namespace std;

int main() {
  vector<float> array = {1, 2, 3};
  Vectors vec1(array);  // Vectors is the class in firefly
  vec1.print();   // print is the method of class
  return 0;
}
"

#build() {
#	cd ${pkgname}
#	mkdir build
#	cd build
#	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
#}

#package() {
#	cd ${pkgname}/build
#	make
#	sudo make install
#	sudo cp ../INCLUDES/firefly.hpp /usr/include/firefly.hpp
#	echo -e "${example}"
#}

build() {
    cd ${pkgname}
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd ${pkgname}/build
    make DESTDIR="$pkgdir/" install
    install -Dm744 ../INCLUDES/firefly.hpp "$pkgdir/usr/include/firefly.hpp"
}

