# Maintainer: William Sutton <will@sutton-family.org>

pkgname=ser2net-git
pkgdesc="A proxy that allows telnet/tcp connections to be made to serial ports"
pkgrel=0
pkgver=git
arch=(x86_64 aarch64)
url="https://sourceforge.net/projects/ser2net"
license=('GPL')
provides=('ser2net')
conflicts=('ser2net')
depends=('gensio' 'libyaml')
backup=(etc/ser2net/ser2net.yaml)
source=(git+https://github.com/cminyard/ser2net.git
	ser2net.service)
sha256sums=('SKIP'
            'b093e1f5bf7dd826816828623a5c6858f83a9f0dcb1a9785f545b29efd1c320c')

build() {
  cd "$srcdir"/${pkgname}
  test -x configure || ./reconf
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/${pkgname}
  make DESTDIR="$pkgdir" install
  install -Dm0644 ser2net.yaml "$pkgdir"/etc/ser2net/ser2net.yaml
  install -Dm0644 "$srcdir"/ser2net.service "$pkgdir"/usr/lib/systemd/system/ser2net.service
}
