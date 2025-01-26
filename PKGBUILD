# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: antechnologic <antechnologic@pm.me>
# Contributor: Sheng Yu <magicfish1990@gmail.com>
# Contributor: Alex Talker <alextalker@yandex.ru>

pkgname="udptunnel"
pkgver=19
pkgrel=1
pkgdesc="Tunnels TCP over UDP packets"
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/udptunnel"
license=('GPL-3.0-or-later')
depends=('glibc')
_pkgsrc="${pkgname}-r${pkgver}"
source=("${_pkgsrc}.tar.gz::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${_pkgsrc}.tar.gz")
b2sums=('63e87d8f510b496ff37b610206d488e58e8c6fddb2ec30d89472bd4da18d83dc0296eb7bf31f66b51b2e51e5d40b3d51eaf3ac5ea6f9374d9917e57081eb670f')

prepare() {
  cd "${srcdir}"
  rm -rf "${_pkgsrc}"
  mv -f "${pkgname}" "${_pkgsrc}"

  cd "${_pkgsrc}"
  sed -i 's/^CFLAGS=/CFLAGS+=/' 'Makefile'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README"     "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "TODO"       "${pkgdir}/usr/share/doc/${pkgname}/TODO"
  install -vDm644 "COPYING"    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
