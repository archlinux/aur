# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=addinclude
pkgver=1.0.1
pkgrel=4
pkgdesc='Add include statements to header and sourcefiles, for C and C++'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://addinclude.roboticoverlords.org/'
license=('GPL2')
makedepends=('go')
source=("https://addinclude.roboticoverlords.org/$pkgname-$pkgver.tar.xz"{,.asc})
validpgpkeys=('962855F072C7A01846405864FCF3C8CB5CF9C8D4')
sha512sums=('bb73427f85abd747104e2b24c19da3e1daf31ee0af2f1da5c268ef47cd8657c2e06d6a0611c153afeae1492752926f3765521643ee41a6337a7fe40ca55336aa'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
