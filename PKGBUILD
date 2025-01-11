# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="915resolution"
pkgver=0.5.3
pkgrel=2
pkgdesc="Modify the video BIOS of the 800 and 900 series Intel graphics chipsets"
arch=('i686' 'x86_64')
url="https://915resolution.mango-lang.org"
license=('custom:Public Domain')
provides=('dump_bios')
conflicts=('dump_bios')
depends=('glibc' 'sh')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/${_pkgsrc}.tar.gz")
sha256sums=('b64cab834b5e410bca555dc9db8e69f62f6f02496942f35ff4a68f3f27f1b542')

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${LDFLAGS} -o "${pkgname}" "${pkgname}.c"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm755 "dump_bios"  "${pkgdir}/usr/bin/915dump_bios"
  install -vDm644 "changes.log"      "${pkgdir}/usr/share/doc/${pkgname}/changes.log"
  install -vDm644 "chipset_info.txt" "${pkgdir}/usr/share/doc/${pkgname}/chipset_info.txt"
  install -vDm644 "README.txt"       "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "LICENSE.txt"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
