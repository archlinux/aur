# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=android-google-apis-x86-system-image
pkgver=28_r08
pkgrel=1
pkgdesc='Android with Google APIs x86 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/x86-${pkgver}.zip"
        "package.xml")
sha256sums=('1f8c647ef7d5b6e53fcbc8528e008ad86a7128b2d072eec8681c2ff2a5bda7c7'
            'e033df09c06a5764439fa00be3e4577fd47d237fa6565ac38eb2a51968518b26')

prepare() {
  # Fix permissions
  cd 'x86'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis"
  cp -r 'x86' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/x86/"
}
