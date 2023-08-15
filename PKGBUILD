# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=android-sdk-cmake-3.18
_major=3
_minor=18
_micro=1
pkgver=$_major.$_minor.$_micro
_magic=ba34c321f92f6e6fd696c8354c262c122f56abf8
pkgrel=1
pkgdesc='CMake from Google Android SDK'
arch=('x86_64')
url="https://developer.android.com/studio/index.html"
license=('custom:android-sdk-license')
depends=('bash')
makedepends=('libxml2') # xmllint
source=("https://dl-ssl.google.com/android/repository/cmake-${pkgver}-linux.zip"
        package.xml)
install=android-sdk-cmake.install
# sha1sum is from https://dl.google.com/android/repository/repository2-1.xml
sha1sums=('9435bbe2120763871c75c37a365451b48c007fed'
          '6c281bb95f51b12495c3fd73158544293d6c5427')
options=('!strip')

package() {
  install -Ddm755 "${pkgdir}/opt/android-sdk/cmake/${pkgver}"
  cp -dr --no-preserve=ownership {bin,doc,share,source.properties} \
    "${pkgdir}/opt/android-sdk/cmake/${pkgver}"

  # This is required for sdkmanager to recognize this package
  install -Dm644 package.xml "${pkgdir}/opt/android-sdk/cmake/${pkgver}/package.xml"
  install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  xmllint --xpath '//*[local-name()="repository"]/license/text()' package.xml \
    > "${pkgdir}/usr/share/licenses/${pkgname}/android-sdk-license"
}
