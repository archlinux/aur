# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vhba-dkms
pkgver=20140928
pkgrel=2
pkgdesc='VHBA kernel module sources (DKMS)'
arch=('any')
url='http://cdemu.sourceforge.net/'
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel'
            'linux-lts-headers: build the module against LTS Arch kernel')
provides=("vhba-module=${pkgver}")
conflicts=('vhba-module')
install='vhba-dkms.install'
source=("http://downloads.sourceforge.net/cdemu/vhba-module-${pkgver}.tar.bz2"
        'dkms.conf'
        '60-vhba.rules')
sha256sums=('45f56e4972b5aa7175903307901ca42d29da6fc8f92ab4c47007f53bc5bb55a2'
            'a663db5183d0c7e2d830d33d56aeaaeded2f3d13d72f602bca6c74549c7696ae'
            '3052cb1cadbdf4bfb0b588bb8ed80691940d8dd63dc5502943d597eaf9f40c3b')

prepare() {
  cd vhba-module-${pkgver}

  sed "s/@VERSION@/${pkgver}/g" -i ../dkms.conf
}

package() {
  cd vhba-module-${pkgver}

  install -dm 755 "${pkgdir}"/usr/{lib/udev/rules.d,src/vhba-${pkgver}}
  install -m 644 {Makefile,vhba.c} "${pkgdir}"/usr/src/vhba-${pkgver}/
  install -m 644 ../dkms.conf "${pkgdir}"/usr/src/vhba-${pkgver}/
  install -m 644 ../60-vhba.rules "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et:
