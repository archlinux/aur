# Maintainer: farwayer <farwayer@gmail.com>
# Contributor: lestb
# Contributor: Philipp Wolfer
# Contributor: Joel Pedraza
# Contributor: Jakub Schmidtke

pkgname=android-platform-33
_apilevel=33
_rev=r02
pkgver=${_apilevel}_${_rev}
pkgrel=4
pkgdesc="Android SDK Platform, latest API"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("https://dl.google.com/android/repository/platform-${_apilevel}_${_rev}.zip"
         "package.xml")
sha256sums=('f851b13fe89f8510a1250df5e8593e86176b2428f4f3cbe0e304a85818c07bc8'
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
