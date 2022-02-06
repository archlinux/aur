pkgname=rteval
pkgver=3.3
pkgrel=1
pkgdesc="Evaluate performance of realtime Linux kernel on a particular hardware platform"
arch=('x86_64')
url="https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/rteval"
license=('GPL2')
groups=('realtime')
depends=('rt-tests' 'python-ethtool' 'python-lxml' 'python-dmidecode')
source=("git+https://git.kernel.org/pub/scm/utils/rteval/rteval.git#commit=d83a407fb55bf2a759097f95a8e8337699b9dfa2")
md5sums=('SKIP')

prepare() {
  cd "${pkgname}"
  KLOAD="linux-5.13.2.tar.xz"
  if [ ! -f "loadsource/$KLOAD" ]; then
    wget -P loadsource https://www.kernel.org/pub/linux/kernel/v5.x/$KLOAD
  fi
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
