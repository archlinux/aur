# Maintainer: fathoni.id(at)gmail.com
# Contributor: nous(at)artixlinux.org

pkgname=input-veikk-config
_pkgname=veikk-linux-driver-gui 
pkgver=2.0
pkgrel=1
pkgdesc="A graphical configuration tool to easily customize the module parameters for the input-veikk-dkms"
arch=('any')
url="https://github.com/jlam55555/${_pkgname}"
license=('GPL')
depends=('input-veikk-dkms')
makedepends=('cmake' 'qt5-tools')
source=("https://codeload.github.com/jlam55555/${_pkgname}/tar.gz/v${pkgver}" 'fix.patch')
sha1sums=('09e72cfc11d62f54fab398931060fb7d5bd7258b'
          '8784d971e57f2d1b3290fb42752b2178a15ba61f')

prepare(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch --strip=1 --input="${srcdir}/fix.patch"
}
          
build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  mkdir -p build && cd build
  qmake ..
  make
}

package() {
  make -C ${srcdir}/${_pkgname}-${pkgver}/build INSTALL_ROOT="$pkgdir" install
}

