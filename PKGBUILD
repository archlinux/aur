# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>

_apilevel=25
_arch=x86
pkgname=android-${_arch}-system-image-${_apilevel}
pkgver=r01
pkgrel=1
pkgdesc="Android ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://developer.android.com/studio/index.html'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/android/${_arch}-${_apilevel}_${pkgver}.zip")
        sha256sums=('a9908b08e295e00cf03261f7f276744cf31ba8be6a065a063239e2a14a57b3da')

prepare() {
  # Fix permissions
  cd "${_arch}"
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/${_arch}" "${_destdir}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
