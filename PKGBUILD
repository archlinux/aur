# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Kppqju77

pkgname=android-google-apis-x86-64-system-image
pkgver=29_r10
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
sha256sums=('bdd82da247161e4464f6016a051b74d3dddf99f2a797d8ea5437ed6ca73b4e6a'
            '4319fe5978d989d04ce2425de6e813a59f871e39233f3ff6b030619b7e4dcd71')

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
