# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=lua51-lpty
pkgver=1.2.1
_upstream_rel=1
pkgrel=2
pkgdesc="pty control for lua 5.1"
arch=('i686' 'x86_64')
url="http://tset.de/lpty/index.html"
license=('MIT')
depends=('lua51')
source=("http://tset.de/downloads/lpty-${pkgver}-${_upstream_rel}.tar.gz"
        "Makefile.patch")
sha1sums=('56e7679565a5a0bf94371e9ef33a7e3a9a1a7ba5'
          'c7d86d854d05d4a941a8a68ffbd59ea4a519ecd3')

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
