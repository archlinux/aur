# Maintainer: gosciunew <gosciunew@gmail.com>
 
pkgname=openambit
pkgver=0.5
pkgrel=1
epoch=1
pkgdesc="Open software for the Suunto Ambit(2)"
arch=('i686' 'x86_64')
url="https://github.com/openambitproject/openambit"
license=('GPL3+')
depends=('qt5-base')
optdepends=()
makedepends=('gcc' 'make' 'cmake' 'qt5-tools')
conflicts=('openambit-git')
options=('!strip' '!emptydirs')
 
source=("$pkgname::git+https://github.com/openambitproject/${pkgname}.git#branch=master")
 
sha512sums=('SKIP')
 
prepare() {
  msg2 "Prepare"
}
 
build() {
  msg2 "Build"
  cd "${srcdir}/${pkgname}"
  BUILD_EXTRAS=0 ./build.sh -DCMAKE_BUILD_TYPE=Release
}
 
package() {
  msg2 "Package"
  install -Dm0644 "${srcdir}/${pkgname}/libambit-build/libambit.so.0.5.0" "${pkgdir}/usr/lib/${pkgname}/libambit.so.0.5.0"
  ln -s /usr/lib/${pkgname}/libambit.so.0.5.0 $pkgdir/usr/lib/libambit.so.0
  ln -s /usr/lib/${pkgname}/libambit.so.0 $pkgdir/usr/lib/libambit.so
 
  install -Dm0644 "${srcdir}/${pkgname}/movescount-build/libmovescount.so.0.3.0" "${pkgdir}/usr/lib/${pkgname}/libmovescount.so.0.3.0"
  ln -s /usr/lib/${pkgname}/libmovescount.so.0.3.0 $pkgdir/usr/lib/libmovescount.so.0
  ln -s /usr/lib/${pkgname}/libmovescount.so.0 $pkgdir/usr/lib/libmovescount.so
 
  install -Dm0755 "${srcdir}/${pkgname}/openambit-build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${srcdir}/${pkgname}/src/libambit/libambit.rules" "${pkgdir}/usr/lib/udev/rules.d/99-suunto-ambit.rules"
 
  install -Dm0644 "${srcdir}/${pkgname}/tools/movescountXmlDiff.pl" "${pkgdir}/usr/share/${pkgname}/movescountXmlDiff.pl"
  install -Dm0644 "${srcdir}/${pkgname}/tools/openambit2gpx.py" "${pkgdir}/usr/share/${pkgname}/openambit2gpx.py"
}
