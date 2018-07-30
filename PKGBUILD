# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=beanseye
_gitcommit=91f8f688b5630cce266e3d99c0421956441b2d65

pkgname=beanseye-git
pkgver=0.0.0+1+91f8f68
pkgrel=1
pkgdesc="Proxy and monitor for beansdb in Go"
url="https://github.com/douban/beanseye"
makedepends=('git' 'go')
arch=('x86_64')
license=('custom')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # binary and static files
  install -d -m755 "${pkgdir}"/usr/bin
  install -d -m755 "${pkgdir}"/usr/share/"${_pkgname}"/{bin,conf,static,tests}
  install -D -m755 bin/proxy "${pkgdir}/usr/share/${_pkgname}/bin/proxy"
  install -D -m644 conf/* "${pkgdir}/usr/share/${_pkgname}/conf/"
  install -D -m644 static/* "${pkgdir}/usr/share/${_pkgname}/static/"
  install -D -m644 tests/* "${pkgdir}/usr/share/${_pkgname}/tests/"
  ln -s "/usr/share/${_pkgname}/bin/proxy" "${pkgdir}/usr/bin/beanseye"

  ## document
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
