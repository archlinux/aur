# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>

pkgname=android-x86-64-system-image
pkgver=28_r04
pkgrel=1
pkgdesc='Android x86_64 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/x86_64-${pkgver}.zip"
        "package.xml")
sha256sums=('ff6ce81aa1424951a214da5f392f8e12382de46d33c08aeaa5d21caba6a39b62'
            'e2b2a2cfaaafeb8c314a7cae52f94b3c024888f3980033cf7c29ece986b0a842')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/default"
  cp -r 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/default/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/default/x86_64/"
}
