# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-playstore-x86-system-image
pkgver=30_r05
pkgrel=1
pkgdesc='Android with Google APIs and Play Store x86 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"http://dl.google.com/android/repository/sys-img/google_apis_playstore/x86-${pkgver}-linux.zip"
        "package.xml")
sha256sums=('c8aeab7869617a9e006b45a886c4c5d0300c35aaa8335bca76e08c675b2fd357'
            'c2c242fe911802433de165b558059a6a56980da776dc394e524bc1b31f6c8946')

prepare() {
  # Fix permissions
  cd 'x86'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore"
  cp -r 'x86' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/x86/"
}
