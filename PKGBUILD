# Maintainer: Zack Didcott

pkgname=ocproxy-git
_pkgname=ocproxy
pkgver=1.60.r9.gc98f06d
pkgrel=3
epoch=
pkgdesc="A user-level SOCKS and port forwarding proxy for OpenConnect based on lwIP"
depends=('libevent' 'glibc')
makedepends=('git')
optdepends=('dante: SOCKS proxy server and client'
            'openconnect: Open client for Cisco AnyConnect VPN')
provides=("ocproxy")
conflicts=("ocproxy")
arch=('i686' 'x86_64')
url="https://github.com/cernekee/ocproxy"
license=('BSD')
source=("git+https://github.com/cernekee/ocproxy.git"
"https://raw.githubusercontent.com/cernekee/ocproxy/6e2291b8fd120128873646156f8cb97b31a330fb/LICENSE")
md5sums=('SKIP'
         'c15ed9963411b4566976d06cdbc1f43f')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
