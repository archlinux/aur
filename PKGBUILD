# Maintainer: gspu <bssbk2455[at]gmail[dot]com>

pkgname=bitkeeper
pkgver=7.3.2
pkgrel=1
pkgdesc="a fast, enterprise-ready, distributed SCM"
arch=("i686" "x86_64")
license=("Apache 2.0")
depends=("libxft")
url="http://www.bitkeeper.org"

source_i686=("https://github.com/bitkeeper-scm/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86-glibc219-linux.bin")
source_x86_64=("https://github.com/bitkeeper-scm/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86_64-glibc219-linux.bin")

sha256sums_i686=('f327b28a5ffe34988a2c4f738d33f8ebe86e29043167dfdec096657ce4e19981')
sha256sums_x86_64=('7fe084cec862d297254793399a537344b054fd8efeb174d9cc6269f85c24b745')

package() {
  _arch=${CARCH}
  if [ "${_arch}" == "i686" ]; then
    _arch=x86
  fi

  chmod +x ${srcdir}/bk-${pkgver}-${_arch}-glibc219-linux.bin
  ${srcdir}/bk-${pkgver}-${_arch}-glibc219-linux.bin ${pkgdir}/opt/bitkeeper

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bitkeeper/bk ${pkgdir}/usr/bin

  chmod go-w -R ${pkgdir}/*
}
