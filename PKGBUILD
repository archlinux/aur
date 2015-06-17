pkgname=libevent-git
pkgver=2.1.5.beta.r27.g31c6d45
pkgrel=1
pkgdesc="An event notification library"
arch=('i686' 'x86_64')
url="http://libevent.org/"
license=('BSD')
depends=('openssl')
optdepends=('python2: to use event_rpcgen.py')
provides=(libevent)
conflicts=(libevent)
replaces=(libevent)
source=(git+https://github.com/libevent/libevent)
md5sums=('SKIP')

pkgver() {
  cd libevent
  git describe --long | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd libevent
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd libevent
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE "${pkgdir}"/usr/share/licenses/libevent/LICENSE
}
