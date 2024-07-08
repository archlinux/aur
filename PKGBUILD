# Maintainer: Kppqju77

pkgname=android-platform-34
_apilevel=34
_extension=7
pkgver=r03
pkgrel=1
pkgdesc="Android SDK Platform, API ${_apilevel}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('LicenseRef-custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip' '!debug')
source=("https://dl.google.com/android/repository/platform-${_apilevel}-ext${_extension}_${pkgver}.zip"
         "package.xml")
sha256sums=('16fdb74c55e59ae3ef52def135aec713508467bd56d7dabcd8c9be31fa8b20f3'
            'ca0589a9b89c09d678b48a9b041decd486106e309da98186a58b2e7e30fef3fd')

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
