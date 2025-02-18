# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="opencflite"
_commit_rel="e68f449d45c87fa086c412d05f9660f8a7979cf7" # 635.21.8
_commit="bf3aee706345f82fc17ff1e980415c6e70fbb474" # r6
pkgver="635.21.8+r6+g${_commit::7}"
pkgrel=1
pkgdesc="Cross platform port of the macOS CoreFoundation"
arch=('x86_64')
url="https://github.com/gerickson/${pkgname}"
license=('APSL-2.0')
depends=('glibc' 'icu' 'libkqueue' 'util-linux-libs')
makedepends=('autoconf-archive')
provides=('libCoreFoundation'{,'_debug','_profile'}'.so')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('9e53620c584efdef32e2fcb5f7324403650f54d0f88f8e0e2cc80e5759cf5df6')

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --with-tz-includes='include'
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "TODO.md"   "${pkgdir}/usr/share/doc/${pkgname}/TODO.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
