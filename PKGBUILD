# Maintainer: 7Ji <pugokushin@gmail.com>

_pkgname=YAopenvfD
pkgname=${_pkgname,,}
pkgver=1.0.1
pkgrel=1
pkgdesc="Yet Another openvfd Daemon"
arch=('aarch64')
url="https://github.com/7Ji/${_pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('gcc')
optdepends=(
  'openvfd-dkms: dynamiclly compiled openvfd kernel module'
  'linux-aarch64-flippy: kernel that has the openvfd kernel module built in tree'
)
conflicts=(
  'openvfd-service'
)
backup=(
  "etc/conf.d/${_pkgname}"
)
_srcname="${_pkgname}-${pkgver}"
source=(
  "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${_pkgname}.conf"
  "${_pkgname}.service"
)
sha256sums=(
  '57597d9888af30447d41dd420382bb7913b73e398134a56e53283f442637d4b4'
  '7bda38711e099460f301d464d537c1269d7a204c0b305c3c92b1add3d85822ed'
  '376c0c22e9731b2954db4caca46653d448c17e7fe47d90e99668643e265e04f8'
)

build() {
  cd "${srcdir}/${_srcname}"
  make "VERSION=${pkgver}-ArchLinux-${pkgrel}"
}

package() {
  install -Dm755 "${srcdir}/${_srcname}/${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -DTm644 "${srcdir}/${_pkgname}.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
}