# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=lua51-lpty
pkgver=1.2.1
_upstream_rel=1
pkgrel=1
pkgdesc="pty control for lua 5.1"
arch=('i686' 'x86_64')
url="http://tset.de/lpty/index.html"
license=('MIT')
depends=('lua51')
source=("http://tset.de/downloads/lpty-${pkgver}-${_upstream_rel}.tar.gz"
        "Makefile.patch")
sha1sums=('56e7679565a5a0bf94371e9ef33a7e3a9a1a7ba5'
          '260122987581be795299cb8f3afff22f79094af0')

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
