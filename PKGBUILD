# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Nicola Fontana <ntd@entidi.it>
pkgname='etherlab-ethercat-dkms'
pkgver=1.6.7
pkgrel=3
pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
arch=('any')
url='https://etherlab.org'
license=('GPL-2.0-only')
depends=('dkms' 'etherlab-ethercat-tools')
provides=('etherlab-ethercat')
conflicts=('etherlab-ethercat')
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "dkms.conf")
sha512sums=('1a26b6fbbae7cf371468171dc2d05190ab4461b7e1bcce6ded51207c2083f8c9b8a426d37887b144011f364b4d55acb59ee563d3d48b17c8956e94e321dda34a'
            '1b13d1fab22d82b08af2c90535ad4e02f232ff4cadd22a0aea5a7819c857862e64f50daa5445ed512527fa7a3b1d038d6da93046e35182330ec0e7112d908ca9')

package() {
  mkdir -p "$pkgdir/usr/src"
  cp -a "ethercat-$pkgver" "$pkgdir/usr/src"
  # Install `dkms.conf` with the proper ethercat version
  sed -e "s/#MODULE_VERSION#/$pkgver/" dkms.conf > "$pkgdir/usr/src/ethercat-$pkgver/dkms.conf"
}
