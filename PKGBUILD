# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=openambit-git
_pkgname=openambit
pkgver=20150825
pkgrel=2
epoch=1
pkgdesc="Open software for the Suunto Ambit(2) - Git master branch"
arch=('i686' 'x86_64')
url="http://openambit.org/"
license=('BSD')
#depends=('qt4' 'qjson' 'zlib' 'libusb' 'libpcap')
optdepends=()
makedepends=('cmake' 'gcc' 'glibc' 'qt4' 'qjson' 'zlib' 'libusb' 'libpcap')
conflicts=('openambit')
options=('!strip' '!emptydirs')

source=("${_pkgname}::git+https://github.com/openambitproject/${_pkgname}.git")

sha512sums=('SKIP')

prepare() {
  msg2 "Prepare"
}

build() {
  msg2 "Build"
  cd "${srcdir}/${_pkgname}"
  ./build.sh -DCMAKE_BUILD_TYPE=Debug
}

package() {
  msg2 "Package"
  install -Dm0644 "${srcdir}/${_pkgname}/libambit-build/libambit.so.0.3.0" "${pkgdir}/usr/lib/${_pkgname}/libambit.so.0.3.0"
  ln -s /usr/lib/${_pkgname}/libambit.so.0.3.0 $pkgdir/usr/lib/libambit.so.0
  ln -s /usr/lib/${_pkgname}/libambit.so.0 $pkgdir/usr/lib/libambit.so

  install -Dm0755 "${srcdir}/${_pkgname}/openambit-build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 "${srcdir}/${_pkgname}/src/libambit/libambit.rules" "${pkgdir}/usr/lib/udev/rules.d/99-libambit.rules"

  install -Dm0644 "${srcdir}/${_pkgname}/tools/movescountXmlDiff.pl" "${pkgdir}/usr/share/${_pkgname}/movescountXmlDiff.pl"
  install -Dm0644 "${srcdir}/${_pkgname}/tools/openambit2gpx.py" "${pkgdir}/usr/share/${_pkgname}/openambit2gpx.py"
}
