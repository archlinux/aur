# Maintainer: Alfredo Luque <me@aluque.io>>
pkgname=cctz
pkgver=2.0
pkgrel=1
pkgdesc="CCTZ timezone library"
url="https://github.com/google/cctz"
license=('GPL')
provides=('cctz')
arch=('i686' 'x86_64')
source=("${pkgname}.tar.gz::https://github.com/google/cctz/archive/v${pkgver}.tar.gz" "${pkgname}.tar.gz.sig")
sha512sums=("039b6df6d428c3f138e6e7687e65936a1fe4239a3f82b5a97936700aee429064220931437843cf5ba610bf1de6731ad8c4df55917076bf802ea102032b4fbaa2" "4f7a3d3bb9ed39ab25678b7b1d2872f3a1f075351d2912d0a99b3dc6ebe4fe942fe69954c110a403f585c38055a6dc9631089a82eb27b7d3bf6798f79b9ad5a6")
validpgpkeys=("39472B6C17DD759D38770C6BC1221376599189E3")
prepare() {
  sed -i -e "/OPT\ =/d" ${pkgname}-${pkgver}/Makefile #Remove hardcoded options
  sed -i -e "/PREFIX\ =/d" ${pkgname}-${pkgver}/Makefile #Remove hardcoded prefix
  sed -i -e "/CXX\ =/d" ${pkgname}-${pkgver}/Makefile #Remove hardcoded CXX variable
}

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make CXXFLAGS="-O3" PREFIX="/usr" CXX?="g++"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/include/civil_time.h "$pkgdir"//usr/include/cctz/civil_time.h
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/include/civil_time_detail.h "$pkgdir"/usr/include/cctz/civil_time_detail.h
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/include/time_zone.h "$pkgdir"/usr/include/cctz/time_zone.h
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/include/time_zone.h "$pkgdir"/usr/include/cctz/time_zone.h
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/libcctz.a "$pkgdir"/usr/lib/libcctz.a
}
