# Maintainer: Kppqju77 <ju.adde-gmail-com>

pkgname=android-platform-31
_apilevel=31
_rev=r01
pkgver=${_rev}
pkgrel=1
pkgdesc="Android SDK Platform, API 31"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("https://dl.google.com/android/repository/platform-${_apilevel}_${_rev}.zip"
         "package.xml")
sha256sums=('1d69fe1d7f9788d82ff3a374faf4f6ccc9d1d372aa84a86b5bcfb517523b0b3f'
            '4123247b0c142b65cbf9f9cf941c4c5c5d3267ea74f36b37aac6ae85f737c09d')

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
