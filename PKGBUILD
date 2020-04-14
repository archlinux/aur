# Maintainer:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf
pkgver=0.0.7
pkgrel=1
pkgdesc='BPF library'
depends=('libelf' 'linux-api-headers')
url='https://github.com/libbpf/libbpf'
license=('custom')
makedepends=('rsync')
arch=('x86_64')
source=("git+https://github.com/libbpf/libbpf#tag=v${pkgver}")
sha256sums=('SKIP')

prepare () {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  DESTDIR="${pkgdir}" make prefix=/usr install install_headers
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgname}/LICENSE"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgname}/LICENSE.BSD-2-Clause"
  pushd "${pkgdir}/usr"
  mv lib64 lib
  popd
}
