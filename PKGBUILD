# Maintainer: farwayer <farwayer@gmail.com>
# Contributor: lestb
# Contributor: Philipp Wolfer
# Contributor: Joel Pedraza
# Contributor: Jakub Schmidtke

_apilevel=33
_rev=r03
_ext=ext3
pkgname=android-platform-${_apilevel}
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
provides=("android-platform=${_apilevel}")
conflicts=("android-platform=${_apilevel}")
options=('!strip')
source=("https://dl.google.com/android/repository/platform-${_apilevel}-${_ext}_${_rev}.zip"
         "package.xml")
sha256sums=('b32b10f787867987f03ae8e101d217e053a9065b7136379fb353b388379aed1d'
            '7cf97324916132f88a5ae817f8dec0353b52bbf64c457394c8a52cd3cb9460a8')

package() {
  depends=('android-sdk' 'android-sdk-platform-tools')
  
  mkdir -p "${pkgdir}/opt/android-sdk/platforms/"
  find "${srcdir}" -maxdepth 1 -mindepth 1 -type d | grep -P 'android-[0-9]+(\.[0-9]*)*$' | while read directory; do
      mv "${directory}" "${pkgdir}/opt/android-sdk/platforms/android-${_apilevel}"
  done

  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"

  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/platforms/android-${_apilevel}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
