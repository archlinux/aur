# Maintainer: Denis Yantarev <denis dot yantarev at gmail dot com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Vladimir Koshelenko <koshelenko@rndavia.ru>

pkgname=start-stop-daemon
pkgver=1.17.27
pkgrel=1
pkgdesc='Start and stop system daemon programs'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://packages.debian.org/source/stable/dpkg'
depends=('glibc')
source=("http://http.debian.net/debian/pool/main/d/dpkg/dpkg_$pkgver.tar.xz")
md5sums=('6e2d761a3c4a9a9e1856337557ec1f9e')

build() {
  cd dpkg-$pkgver
  ./configure --disable-dselect --disable-update-alternatives --disable-install-info
  (cd lib && make)
  cd utils && make
}

package() {
  cd dpkg-$pkgver
  install -D -m 755 utils/start-stop-daemon "$pkgdir/usr/bin/start-stop-daemon"
  install -D -m 644 man/start-stop-daemon.8 "$pkgdir/usr/share/man/man8/start-stop-daemon.8"
}

# vim:set ts=2 sw=2 et:
