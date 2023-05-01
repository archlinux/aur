# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>

pkgname=android-x86-64-system-image
pkgver=31_r03
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
source=("${pkgname}-${pkgver}.zip"::"https://dl-ssl.google.com/android/repository/sys-img/android/x86_64-${pkgver}.zip"
        "package.xml")
sha256sums=('d1e1c91029ab29b9edc53ba4aa22337d04e02c4e2b29c2bde05eedd4832a6cd6'
            '12e29d313b85013a980ae697a5e143d766a45ca4d577f1b6017fd38b68d42d4b')

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
