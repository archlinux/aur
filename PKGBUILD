# vim:set ts=2 sw=2 et:
#
# Maintainer: Tblue <tilman (at) ax86 (dot) net>
# Contributor: Schnouki <thomas.jost@gmail.com>

pkgname=mkbold-mkitalic
pkgver=0.11
pkgrel=3
pkgdesc="Make X11 BDF fonts bold and/or italic"
url="https://gitlab.com/unshumikan/mkbold-mkitalic"
license=("LicenseRef-X11")
depends=(glibc)
makedepends=(git)
source=(
  "git+https://gitlab.com/unshumikan/mkbold-mkitalic.git#tag=${pkgver?}"
  "0001-Makefile-Use-CFLAGS-and-LDFLAGS-from-environment.patch"
)
arch=(i686 x86_64)

prepare() {
  cd "${srcdir:?}/${pkgname:?}"

  for i in "${srcdir:?}"/*.patch; do
    [[ ! -f "${i?}" ]] && continue
    patch -Np1 -i "${i?}"
  done
}

build() {
  cd "${srcdir:?}/${pkgname:?}"

  make
}

package() {
  cd "${srcdir:?}/${pkgname:?}"

  install -Dm644 LICENSE "${pkgdir:?}/usr/share/licenses/${pkgname?}/LICENSE"
  install -Dm644 README "${pkgdir:?}/usr/share/doc/${pkgname?}/README"

  make prefix="/usr" DESTDIR="${pkgdir:?}" install
}

sha256sums=('015ac7e34dcc3e1349fd8ca03441e1c865861dad419c097736a01b5055628ff0'
            'e3ee710a7a0bd4659b272cd2bb67f14b46200edc75c0fdb922640d35d929c936')
