# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=lua52-lpty
pkgver=1.2.2
_upstream_rel=1
pkgrel=1
pkgdesc="pty control for lua 5.2"
arch=('i686' 'x86_64')
url="http://tset.de/lpty/index.html"
license=('MIT')
depends=('lua52')
source=("http://tset.de/downloads/lpty-${pkgver}-${_upstream_rel}.tar.gz"
        "Makefile.patch")
sha1sums=('ccacc8f1f1ef87f8339322eb519d0937324b5e5e'
          '7a21cde96f4d07ea639cf0257cfa365b760563ae')

prepare() {
  cd "${srcdir}/lpty-${pkgver}-${_upstream_rel}"
  patch <"${srcdir}/Makefile.patch"
}

build() {
  cd "${srcdir}/lpty-${pkgver}-${_upstream_rel}"
  make
}

package() {
  cd "${srcdir}/lpty-${pkgver}-${_upstream_rel}"
  make install INST_DIR="${pkgdir}/usr"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/* samples "${pkgdir}/usr/share/doc/${pkgname}/"
}
