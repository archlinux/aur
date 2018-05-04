# Maintainer: gspu <bssbk2455[at]gmail[dot]com>

pkgname=bitkeeper-production-bin
pkgver=7.3.2
pkgrel=1
pkgdesc="a fast, enterprise-ready, distributed SCM"
arch=("i686" "x86_64")
license=("Apache 2.0")
depends=("libxft")
url="http://www.bitkeeper.org"

source_i686=("https://github.com/bitkeeper-scm/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86-glibc27-linux.bin")
source_x86_64=("https://github.com/bitkeeper-scm/bitkeeper/releases/download/bk-${pkgver}/bk-${pkgver}-x86_64-glibc27-linux.bin")

sha256sums_i686=('41fec94fb9e001da2f43b46126ce1e52c42d0db6bd8c9afdad08c4db787e3a17')
sha256sums_x86_64=('b06bb7d288b04da1ea3c89669d087eb735844a6370ae7dd5b7784365f0f075aa')

package() {
  _arch=${CARCH}
  if [ "${_arch}" == "i686" ]; then
    _arch=x86
  fi

  chmod +x ${srcdir}/bk-${pkgver}-${_arch}-glibc27-linux.bin
  ${srcdir}/bk-${pkgver}-${_arch}-glibc27-linux.bin ${pkgdir}/opt/bitkeeper

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/bitkeeper/bk ${pkgdir}/usr/bin

  chmod go-w -R ${pkgdir}/*
}
