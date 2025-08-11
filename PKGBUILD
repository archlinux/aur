# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-playstore-x86-64-system-image
pkgver=34_r14
pkgrel=2
pkgdesc='Android with Google APIs and Play Store x86_64 Atom System Image, latest API'
arch=('any')
url='https://developer.android.com/studio/index.html'
license=('LicenseRef-android-sdk-license')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"http://dl.google.com/android/repository/sys-img/google_apis_playstore/x86_64-${pkgver}.zip"
        "package.xml")
sha256sums=('22e7797a7e14d346bc6ed867d84ed423beaf4364db567edaa97f85a99558cf80'
            'e31bb01dd337f73a015f4b8d3556bc054be7116809eedad46f5888ed92fcba40')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore"
  cp -r 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/x86_64/"
}
