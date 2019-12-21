# Maintainer:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf-git
pkgver=0.0.6
pkgrel=1
pkgdesc='BPF library'
depends=('libelf')
url='https://github.com/libbpf/libbpf'
license=('custom')
makedepends=('rsync')
arch=('x86_64')
provides=('libbpf')
source=('git+https://github.com/libbpf/libbpf#tag=v0.0.6')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname%-git}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/src"
  DESTDIR="${pkgdir}" make prefix=/usr install install_headers
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgname%-git}/LICENSE"
  pushd "${pkgdir}/usr"
  mv lib64 lib
  popd
}
