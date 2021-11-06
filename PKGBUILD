# Maintainer: chn <g897331845@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Kppqju77 <ju.adde-gmail-com>

_arch=x86_64
pkgname=android-google-apis-${_arch/_/-}-system-image-30
pkgver=r11
pkgrel=1
pkgdesc="Android with Google APIs ${_arch} Atom System Image, API 30"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/${_arch}-30_${pkgver}.zip"
        "package.xml")
sha256sums=('b2edb48102bb6e0d627180a62acdbe3c2a63a9a8f03c8bbef9c2ca2a23ece1ca'
            '9083cecfe118a97f74ba65cc46893dd96d46da8cc472f1677fec5366c5150544')

prepare() {
  # Fix permissions
  cd "${_arch}"
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  depends=('android-platform-30')
  optdepends=('qemu' 'libvirt')

  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-30/google_apis"
  cp -r "${_arch}" "${pkgdir}/opt/android-sdk/system-images/android-30/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-30/google_apis/${_arch}/"
}
