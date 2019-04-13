# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>

pkgname=android-x86-system-image
pkgver=28_r04
pkgrel=1
pkgdesc='Android x86 Atom System Image, latest API'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/android/x86-${pkgver}.zip"
        "package.xml")
sha256sums=('7c3615c55b64713fe56842a12fe6827d6792cb27a9f95f9fa3aee1ff1be47f16'
            'edd73a16b33c26f30d8f7160ffbce954744e5e69138ce22dd8814ba2d001bd95')

prepare() {
  # Fix permissions
  cd 'x86'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/default"
  cp -r 'x86' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/default/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/default/x86/"
}
