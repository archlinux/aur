pkgname=rteval
pkgver=3.9
pkgrel=2
pkgdesc="Evaluate performance of realtime Linux kernel on a particular hardware platform"
arch=('x86_64')
url="https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rteval"
license=('GPL2')
groups=('realtime')
depends=('rt-tests' 'python-lxml' 'python-dmidecode' 'bc' 'cpio' 'libtraceevent' 'libtracefs' 'python-requests')
makedepends=('wget')
source=("git+https://git.kernel.org/pub/scm/utils/rteval/rteval.git#commit=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "${pkgname}"
  KLOAD="linux-6.12-rc4.tar.gz"
  if [ ! -f "loadsource/$KLOAD" ]; then
    wget -P loadsource https://git.kernel.org/torvalds/t/$KLOAD
  fi
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
