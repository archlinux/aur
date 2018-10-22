# Maintainer: David Runge <dave@sleepmap.de>
pkgname=lvtk
pkgver=1.2.0
pkgrel=1
pkgdesc="Libraries wrapping the LV2 C API and extensions into C++ classes"
arch=('x86_64')
url="https://github.com/lvtk/lvtk"
license=('GPL3')
depends=('boost-libs')
makedepends=('boost' 'gtkmm' 'lv2' 'python2')
optdepends=('gtkmm: example plugins')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f193ec28103cb2f6353ff0f96f8790041baf1ae99472c5d04017c23b42d0179b1f5e1de6722e17080410311d0e7e1de4ca0ae9ab76fb3bf8a02d9dc1451d8db7')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  export CXXFLAGS="-std=c++11 $CXXFLAGS"
  python2 waf configure --prefix=/usr \
                        --boost-includes='/usr/include/boost' \
                        --boost-libs='/usr/lib'
  python2 waf build
}

package() {
  cd "$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"
  install -vDm 644 {AUTHORS,ChangeLog,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
