# Maintainer: goetzc, Skycoder42, Kppqju77
# Contributors: lestb, Philipp Wolfer, Joel Pedraza, Jakub Schmidtke

pkgname=android-platform
_apilevel=30
_rev=r01
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("https://dl.google.com/android/repository/platform-${_apilevel}_${_rev}.zip")
sha1sums=('63aed027a1aa272ff894545af8106255e84f2140')
sha384sums=('c3d9fe96b6d9a36f91a123689465f7c33d4ff2035b2de7510f596ace9f4f1f15135eb8f26b3713df6e55214d9a482723')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  find "${srcdir}" -maxdepth 1 -mindepth 1 -type d | grep -P 'android-[0-9]+(\.[0-9]*)*$' | while read directory; do
      mv "${directory}" "${pkgdir}/opt/android-sdk/platforms/android-${_apilevel}"
  done

  chmod -R ugo+rX "${pkgdir}/opt"
}
