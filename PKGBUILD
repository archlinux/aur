# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Nicola Fontana <ntd@entidi.it>
pkgname='etherlab-ethercat-dkms'
pkgver=1.6.9
pkgrel=1
pkgdesc="Kernel modules for IgH EtherCAT(R) Master component"
arch=('any')
url='https://etherlab.org'
license=('GPL-2.0-only')
depends=('dkms' 'etherlab-ethercat-tools')
provides=('etherlab-ethercat')
conflicts=('etherlab-ethercat')
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "dkms.conf")
sha512sums=('e7135b33d6a72d9d671ddae42cde7d30374c5279efdefd579d52f8a024a549901b854d8cddf14b49e40248aebeeff9e6670a826d36cdab4154f1257e76e3da50'
            '1b13d1fab22d82b08af2c90535ad4e02f232ff4cadd22a0aea5a7819c857862e64f50daa5445ed512527fa7a3b1d038d6da93046e35182330ec0e7112d908ca9')

package() {
  mkdir -p "$pkgdir/usr/src"
  cp -a "ethercat-$pkgver" "$pkgdir/usr/src"
  # Install `dkms.conf` with the proper ethercat version
  sed -e "s/#MODULE_VERSION#/$pkgver/" dkms.conf > "$pkgdir/usr/src/ethercat-$pkgver/dkms.conf"
}
