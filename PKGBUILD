pkgname=rteval
pkgver=3.2
pkgrel=1
pkgdesc="Evaluate performance of realtime Linux kernel on a particular hardware platform"
arch=('x86_64')
url="https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rteval"
license=('GPL2')
groups=('realtime')
depends=('rt-tests' 'python-ethtool' 'python-lxml' 'python-dmidecode')
source=("git+https://git.kernel.org/pub/scm/utils/rteval/rteval.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "${pkgname}"
  KLOAD="linux-5.7.tar.xz"
  if [ ! -f "loadsource/$KLOAD" ]; then
    wget -P loadsource https://www.kernel.org/pub/linux/kernel/v5.x/$KLOAD
  fi
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
