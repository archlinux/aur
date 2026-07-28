pkgname=rteval
pkgver=3.12
pkgrel=1
gitcommit=8f8c40d7be4635e72ac54d42651d4f0d19dc3efd
pkgdesc="Evaluate performance of realtime Linux kernel on a particular hardware platform"
arch=('x86_64')
url="https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rteval"
license=('GPL2')
groups=('realtime')
depends=('rt-tests' 'python-lxml' 'bc' 'cpio' 'libtraceevent' 'libtracefs' 'python-requests')
makedepends=('wget')
source=("git+https://git.kernel.org/pub/scm/utils/rteval/rteval.git#commit=${gitcommit}")
md5sums=('SKIP')

prepare() {
  cd "${pkgname}"
  KLOAD="linux-6.17.7.tar.xz"
  if [ ! -f "loadsource/$KLOAD" ]; then
    wget -P loadsource https://www.kernel.org/pub/linux/kernel/v6.x/$KLOAD
  fi
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
