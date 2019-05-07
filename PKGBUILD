pkgname=ericw-tools
pkgver=0.18.2
_rc="-rc1"
pkgrel=1
pkgdesc="Quake/Hexen 2 Map compiling tools"
arch=('x86_64')
url="http://ericwa.github.io/ericw-tools"
_giturl="https://github.com/ericwa/ericw-tools"
license=('GPL3')
depends=('embree2' 'groff')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${_giturl}/archive/v${pkgver}${_rc}.tar.gz")
sha256sums=('1905752a582882f587b822e4186a7126522833b32b9777dcd46fe0f3c7cedf87')

build() {
    cd ${pkgname}-${pkgver}${_rc}
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    _files=(qbsp vis light bspinfo bsputil)
    for _i in "${_files[@]}"
    do
      install -Dm755 ${pkgname}-${pkgver}${_rc}/build/${_i}/${_i} "$pkgdir"/usr/bin/${_i}
    done
}

