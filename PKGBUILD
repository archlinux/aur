# Maintainer: clouds <clouds.flowing@gmail.com>

pkgname=srelay
pkgver=0.4.8
pkgrel=1
pkgdesc="A Free SOCKS proxy server for Linux, macos and FreeBSD"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://sourceforge.net/p/socks-relay"
license=('BSD')
depends=('sh')
optdepends=('python: generating password')
provides=("srelay")
conflicts=("srelay")
options=('!emptydirs')
backup=('etc/srelay/srelay.conf'
        'etc/srelay/srelay.passwd')
source=("git+https://git.code.sf.net/p/socks-relay/${pkgname}")
sha256sums=("SKIP")

#prepare() {
  #cd "${srcdir}/${pkgname}"
#}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  #make DESTDIR="$pkgdir" install
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 scripts/srpasswd.py "$pkgdir"/usr/bin/srpasswd.py
  install -Dm644 scripts/srelay.service "$pkgdir"/usr/lib/systemd/system/srelay.service
  install -Dm644 srelay.conf "$pkgdir"/etc/srelay/srelay.conf
  install -Dm644 srelay.passwd "$pkgdir"/etc/srelay/srelay.passwd
  install -Dm644 srelay.8 "$pkgdir"/usr/share/man/man8/srelay.8
  #install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
