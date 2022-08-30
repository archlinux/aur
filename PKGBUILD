# Maintainer: Denis Yantarev <denis.yantarev@gmail.com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Vladimir Koshelenko <koshelenko@rndavia.ru>

pkgname=start-stop-daemon
pkgver=1.21.9
pkgrel=1
pkgdesc='Start and stop system daemon programs'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://packages.debian.org/source/sid/dpkg'
depends=('glibc')
makedepends=('perl')
source=("http://deb.debian.org/debian/pool/main/d/dpkg/dpkg_$pkgver.tar.xz")
md5sums=('15bc7cc25cc5afd546d3d06755248878')

build() {
  cd dpkg-$pkgver
  ./configure --disable-dselect --disable-update-alternatives
  (cd lib && make)
  (cd man && make)
  cd utils && make
}

package() {
  cd dpkg-$pkgver
  install -D -m 755 utils/start-stop-daemon "$pkgdir/usr/bin/start-stop-daemon"
  install -D -m 644 man/start-stop-daemon.8 "$pkgdir/usr/share/man/man8/start-stop-daemon.8"
}

# vim:set ts=2 sw=2 et:
