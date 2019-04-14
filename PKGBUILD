# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-x86-64-system-image
pkgver=28_r08
pkgrel=1
pkgdesc='Android with Google APIs x86_64 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/x86_64-${pkgver}.zip"
        "package.xml")
sha256sums=('1d6d34c6e3a683bfd6e26c70b5f8a7bfccba8878b2466faf3311181612f48914'
            'e31f698a253599c77f1375104c4c3e2763af0c80ee36f1d564182639a4645a39')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis"
  cp -r 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/x86_64/"
}
