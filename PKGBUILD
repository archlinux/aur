# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Nicola Fontana <ntd@entidi.it>
pkgname='etherlab-ethercat-dkms'
pkgver=1.6.8
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
sha512sums=('3da61f7a2d50f01bc2907877cbd046861ad9fb3be0b38f0e8aa5ecbc3dece2c2802b5d56df8da5231467d3c80863fba855d56c4a1ad984442ddc611c1d40beb5'
            '1b13d1fab22d82b08af2c90535ad4e02f232ff4cadd22a0aea5a7819c857862e64f50daa5445ed512527fa7a3b1d038d6da93046e35182330ec0e7112d908ca9')

package() {
  mkdir -p "$pkgdir/usr/src"
  cp -a "ethercat-$pkgver" "$pkgdir/usr/src"
  # Install `dkms.conf` with the proper ethercat version
  sed -e "s/#MODULE_VERSION#/$pkgver/" dkms.conf > "$pkgdir/usr/src/ethercat-$pkgver/dkms.conf"
}
