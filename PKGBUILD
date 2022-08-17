# Maintainer: syntheit <daniel@matv.io>

_pkgname=icu
pkgname=icu67
pkgver=67.1
pkgrel=1
pkgdesc='International Components for Unicode library'
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('python' 'clang' 'make' 'patch')
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
sha512sums=('4779f1ce1ca7976f6fad6768853ea8c540da54d11509e3b6cfd864a04b5f2db1c3d4b546387f91ad02fb90804525bc37d2543173f0d705d6ca11dc6f2b7640a8')


build() {
  cd "${_pkgname}/source"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin

  make
}

check() {
  cd "${_pkgname}/source"

  make -k check
}

package() {
  cd "${_pkgname}/source"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  # Install license
  install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
