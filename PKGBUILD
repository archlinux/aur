# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=roccat-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="Kernel modules for ROCCAT devices"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel'
            'linux-lts-headers: build the module against LTS Arch kernel'
            'roccat-tools: graphical tools to adjust the mouse settings')
conflicts=('kmod-roccat')
provides=('kmod-roccat')
source=("http://downloads.sourceforge.net/project/roccat/linux/kmod-roccat/kmod-roccat-$pkgver.tar.bz2")
install=$pkgname.install
sha256sums=('432c5100bdfbd19f54938129ff18331f70c12d3fd4f145ea5a1093a363ce9594')

package() {
  cd ${srcdir}/kmod-roccat-${pkgver}

#2.6.39_and_up
  
  install -dm755 "${pkgdir}/usr/lib/modprobe.d"
  install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}"
  cp -r ./* "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}/"
  sed -i -e "s/@VERSION@/${pkgver}-${pkgrel}/" "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}/dkms.conf"
  
  install -D override-roccat.conf $pkgdir/usr/lib/depmod.d/override-roccat.conf
}

# vim:set ts=2 sw=2 et:
