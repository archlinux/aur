_rev=r03
_sdkver=7.1.1
_sdkint=25
pkgname=android-platform-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=2
pkgdesc="Android SDK Platform, API-${_sdkint}"
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk' 'android-sdk-platform-tools')
conflicts=("android-platform-${_sdkint}")
options=('!strip')
# android-sdk-license.txt is cut from https://dl.google.com/android/repository/repository2-1.xml
source=("https://dl.google.com/android/repository/platform-${_sdkint}_${_rev}.zip"
        android-sdk-license.txt)
sha1sums=('00c2c5765e8988504be10a1eb66ed71fcdbd7fe8'
          'a35b1b807afb8c2fb35daf3d0ca5f8dbd5fb81dc')

package() {
  install -Ddm755 "${pkgdir}/opt/android-sdk/platforms/"
  cp -dr --no-preserve=ownership "${srcdir}/android-${_sdkver}" \
      "${pkgdir}/opt/android-sdk/platforms/android-${_sdkint}"

  install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/android-sdk-license.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/android-sdk-license.txt"

  chmod -R ugo+rX "${pkgdir}/opt"
}
