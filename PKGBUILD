# Maintainer: gosciunew <gosciunew@gmail.com>
 
pkgname=openambit-git
_pkgname=openambit
pkgver=20210705
pkgrel=1
epoch=1
pkgdesc="Open software for the Suunto Ambit(2) - Git master branch"
arch=('i686' 'x86_64')
url="https://github.com/openambitproject/openambit"
license=('GPL3+')
depends=('qt5-base')
optdepends=()
makedepends=('gcc' 'make' 'cmake' 'qt5-tools')
conflicts=('openambit')
options=('!strip' '!emptydirs')
 
source=("${_pkgname}::git+https://github.com/openambitproject/${_pkgname}.git#branch=master")
 
sha512sums=('SKIP')
 
prepare() {
  msg2 "Prepare"
}
 
build() {
  msg2 "Build"
  cd "${srcdir}/${_pkgname}"
  BUILD_EXTRAS=0 ./build.sh -DCMAKE_BUILD_TYPE=Release
}
 
package() {
  msg2 "Package"
  install -Dm0644 "${srcdir}/${_pkgname}/libambit-build/libambit.so.0.5.0" "${pkgdir}/usr/lib/${_pkgname}/libambit.so.0.5.0"
  ln -s /usr/lib/${_pkgname}/libambit.so.0.5.0 $pkgdir/usr/lib/libambit.so.0
  ln -s /usr/lib/${_pkgname}/libambit.so.0 $pkgdir/usr/lib/libambit.so
 
  install -Dm0644 "${srcdir}/${_pkgname}/movescount-build/libmovescount.so.0.3.0" "${pkgdir}/usr/lib/${_pkgname}/libmovescount.so.0.3.0"
  ln -s /usr/lib/${_pkgname}/libmovescount.so.0.3.0 $pkgdir/usr/lib/libmovescount.so.0
  ln -s /usr/lib/${_pkgname}/libmovescount.so.0 $pkgdir/usr/lib/libmovescount.so
 
  install -Dm0755 "${srcdir}/${_pkgname}/openambit-build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 "${srcdir}/${_pkgname}/src/libambit/libambit.rules" "${pkgdir}/usr/lib/udev/rules.d/99-suunto-ambit.rules"
 
  install -Dm0644 "${srcdir}/${_pkgname}/tools/movescountXmlDiff.pl" "${pkgdir}/usr/share/${_pkgname}/movescountXmlDiff.pl"
  install -Dm0644 "${srcdir}/${_pkgname}/tools/openambit2gpx.py" "${pkgdir}/usr/share/${_pkgname}/openambit2gpx.py"
}
