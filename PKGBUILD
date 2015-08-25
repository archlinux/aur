# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=openambit
pkgver=0.3
pkgrel=3
epoch=1
pkgdesc="Open software for the Suunto Ambit(2)"
arch=('i686' 'x86_64')
url="http://openambit.org/"
license=('BSD')
#depends=('qt4' 'qjson' 'zlib' 'libusb' 'libpcap')
optdepends=()
makedepends=('cmake' 'gcc' 'glibc' 'qt4' 'qjson' 'zlib' 'libusb' 'libpcap')
conflicts=('openambit-git')
options=('!strip' '!emptydirs')

source=("$pkgname::git+https://github.com/openambitproject/${pkgname}.git#tag=${pkgver}")

sha512sums=('SKIP')

prepare() {
  msg2 "Prepare"
}

build() {
  msg2 "Build"
  cd "${srcdir}/${pkgname}"
  ./build.sh -DCMAKE_BUILD_TYPE=Debug
}

package() {
  msg2 "Package"
  install -Dm0644 "${srcdir}/${pkgname}/libambit-build/libambit.so.0.3.0" "${pkgdir}/usr/lib/${pkgname}/libambit.so.0.3.0"
  ln -s /usr/lib/${pkgname}/libambit.so.0.3.0 $pkgdir/usr/lib/libambit.so.0
  ln -s /usr/lib/${pkgname}/libambit.so.0 $pkgdir/usr/lib/libambit.so

  install -Dm0755 "${srcdir}/${pkgname}/openambit-build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${srcdir}/${pkgname}/src/openambit/deployment/99-suunto-ambit.rules" "${pkgdir}/usr/lib/udev/rules.d/99-suunto-ambit.rules"

  install -Dm0644 "${srcdir}/${pkgname}/tools/movescountXmlDiff.pl" "${pkgdir}/usr/share/${pkgname}/movescountXmlDiff.pl"
  install -Dm0644 "${srcdir}/${pkgname}/tools/openambit2gpx.py" "${pkgdir}/usr/share/${pkgname}/openambit2gpx.py"
}
