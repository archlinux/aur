# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-addon-lifeguard
pkgver=0.0.4
pkgrel=3
pkgdesc="check whether vdr should shutdown the machine"
url="http://e-tobi.net/vdr-experimental/pool-squeeze/source/addons"
arch=('any')
license=('GPL2')
depends=('bash')
optdepends=('samba: To check active samba connections'
           'afpfs-ng: To check active AFP connections')
source=("https://packages.e-tobi.net/vdr-experimental/pool-squeeze/source/addons/vdr-addon-lifeguard_0.0.4.tar.gz"
        "lifeguard-use_ss_instead_of_netstat.diff")
backup=('etc/vdr/lifeguard.conf')
md5sums=('9494c1b691256452ead283f59956ebd4'
         'de99fdd8d1662150408200dcf095519f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/lifeguard-use_ss_instead_of_netstat.diff"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "S91.lifeguard" "${pkgdir}/usr/lib/vdr/shutdown-hooks/S91.lifeguard"
  install -Dm644 "lifeguard.conf" "${pkgdir}/etc/vdr/lifeguard.conf"
  install -Dm644 "vdr-addon-lifeguard.1" "${pkgdir}/usr/share/man/man1/vdr-addon-lifeguard.1"
}
