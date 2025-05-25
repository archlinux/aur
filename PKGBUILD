# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

_apilevel='24'
_rev='r08'
pkgname=android-x86-64-system-image-24
pkgver=7.0_r08
pkgrel=1
pkgdesc="Android x86_64 System Image, API-24"
arch=('any')
url='https://developer.android.com/topic/generic-system-image/releases'
license=('LicenseRef-custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"http://dl.google.com/android/repository/sys-img/android/x86_64-${_apilevel}_${_rev}.zip"
        "source.properties")
sha256sums=('c122b69f70a229186314ec9a6f7abedcc7a6ff7ed52cb6fdce0d4f1585c09f92'
            'a61b6d50ecf6df7d65e2ef09496aba29dbb1823c5b0259ce1803f4359c14b7bf')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  # Install files
  install -d -m 755 "${_destdir}"
  cp -r 'x86_64' "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}"
}

