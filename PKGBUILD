# Maintainer: redfish <redfish at galactica dot pw>

pkgname='xd-torrent-git'
_gitname='XD'
pkgver=0.4.0
pkgrel=1
arch=('any')
url="https://github.com/majestrate/XD"
depends=('go>=1.6' 'i2pd>=2.18')
makedepends=('git')
license=('MIT')
pkgdesc="Standalone I2P BitTorrent Client written in GO"
provides=(xd-torrent)
conflicts=(xd-torrent)
source=("git+https://github.com/majestrate/XD.git"
        "xd.service")
md5sums=('SKIP'
         '7f87ea2d6fc76aee8821efc5709a0115')
install="xd.install"
backup=("etc/xd.conf")

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
   cd "$srcdir/$_gitname"

   install -D -m755 "XD"    "$pkgdir/usr/bin/XD"
   install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   #install -D -m644 "xd.conf" "$pkgdir/etc/xd.conf"
   install -D -m644 "$srcdir/xd.service" "$pkgdir/usr/lib/systemd/system/xd.service"
}
