# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

_apilevel='22'
_rev='r01'
_arch='x86_64'
pkgname="android-${_arch/x86_/x86-}-system-image-${_apilevel}"
pkgver="${_apilevel}_${_rev}"
pkgrel=1
pkgdesc="Android ${_arch} System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname/x86-/x86_}-${_apilevel}")
conflicts=("${pkgname/x86-/x86_}-${_apilevel}")
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
source=("http://dl.google.com/android/repository/sys-img/android/sysimg_${_arch}-${_apilevel}_${_rev}.zip"
        "source.properties")
sha1sums=('05752813603f9fa03a58dcf7f8f5e779be722aae'
          '9c76a74894aa69bdaaa874dac8ba44533c30a542')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/${_arch}" "${_destdir}"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_arch}"

  chmod -R ugo+rX "${pkgdir}/opt"
}

# vim:set et sw=2 sts=2 tw=80: