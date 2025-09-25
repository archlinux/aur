# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Nicola Fontana <ntd@entidi.it>
pkgname='etherlab-ethercat-dkms'
pkgver=1.6.7
pkgrel=1
pkgdesc="Tools for IgH EtherCAT(R) Master component"
arch=('any')
url='https://etherlab.org'
license=('GPL-2.0-only')
depends=('dkms' 'etherlab-ethercat-tools')
provides=('etherlab-ethercat')
conflicts=('etherlab-ethercat')
source=("ethercat-$pkgver.tar.bz2::https://gitlab.com/etherlab.org/ethercat/-/releases/$pkgver/downloads/dist-tarballs/ethercat.tar.bz2"
        "dkms.conf")
sha512sums=('1a26b6fbbae7cf371468171dc2d05190ab4461b7e1bcce6ded51207c2083f8c9b8a426d37887b144011f364b4d55acb59ee563d3d48b17c8956e94e321dda34a'
            '38731dc41da188fbce8ddb181d878e7e3af6639c52b4f6cb0dbb0161b47f074cad70a3416dda1e115c39667ec7a671d1f3a367b38a5a541de2a077b1aba8bd27')

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -a "ethercat-$pkgver" "${pkgdir}/usr/src"
  # Install `dkms.conf` with the proper ethercat version
  sed -e "s/#MODULE_VERSION#/${pkgver}/" dkms.conf > "${pkgdir}/usr/src/ethercat-${pkgver}/dkms.conf"
}
