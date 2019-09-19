# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-x86-64-system-image
pkgver=29_r07
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
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/x86_64-${pkgver}-linux.zip"
        "package.xml")
sha256sums=('ad130238df6be4cb91593a9b8a89b89d75282ce8b162ce3b6418a78c20e8fd88'
            '0b62cbd8f99fcb5e8bc4ae5c65b6b887334ffbcf1dc924ebb7fc93f11a6ef65f')

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
