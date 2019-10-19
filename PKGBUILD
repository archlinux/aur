# Maintainer:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf
pkgver=5.3.7
pkgrel=1
pkgdesc='BPF library'
depends=('libelf')
url='https://github.com/torvalds/linux/tree/master/tools/lib/bpf'
license=('LGPL2.1')
makedepends=('rsync')
arch=('x86_64')
provides=('libbpf')
source=(https://mirrors.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
sha256sums=('c6c9714e21531c825c306b107bc6f6c7bfa2d5270a14bad170f8de5a73d34802'
            'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

build() {
  cd "linux-$pkgver/tools/lib/bpf"
  make
}

package() {
  cd "linux-$pkgver/tools/lib/bpf"
  DESTDIR="${pkgdir}" make prefix=/usr install install_headers
  pushd "${pkgdir}/usr"
  mv lib64 lib
  popd
}
