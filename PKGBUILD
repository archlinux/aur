# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="raidfs"
pkgver=0.3
pkgrel=1
pkgdesc="A data recovery tool used to reassemble RAID subsystems without the corresponding controller"
arch=('x86_64' 'i686')
url="https://${pkgname}.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('fuse2' 'glibc')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.tar.gz")
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgsrc//-/_}.tar.gz")
sha256sums=('d504adbe5f499c5393c622895c64a7b9e38d35d10f238a3c3d4585ffa001904a')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" -C "${srcdir}/${_pkgsrc}"
}

build() {
  cd "${srcdir}/${_pkgsrc}"  
  # make
  gcc ${CFLAGS} ${LDFLAGS} -fmessage-length=0 -D_FILE_OFFSET_BITS=64 -o "${pkgname}" "${pkgname}.c" -lfuse
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${pkgname}"  "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README"      "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
