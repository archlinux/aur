# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vhba-dkms
pkgver=20161009
pkgrel=3
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
        '60-vhba.rules'
        'vhba-linux4.11.patch')
sha256sums=('cd062d8bd61ccb8137622f837a0dadb771cc935981d8bccb2ad4de0bd11f33d9'
            'a663db5183d0c7e2d830d33d56aeaaeded2f3d13d72f602bca6c74549c7696ae'
            '3052cb1cadbdf4bfb0b588bb8ed80691940d8dd63dc5502943d597eaf9f40c3b'
            'a756b78865bfc1ea7eda447cd209035f9da7982174d03e643af3441d50ab3e08')

prepare() {
  cd vhba-module-${pkgver}

  sed "s/@VERSION@/${pkgver}/g" -i ../dkms.conf
  patch -Np2 -i ../vhba-linux4.11.patch
}

package() {
  cd vhba-module-${pkgver}

  install -dm 755 "${pkgdir}"/usr/{lib/udev/rules.d,src/vhba-${pkgver}}
  install -m 644 {Makefile,vhba.c} "${pkgdir}"/usr/src/vhba-${pkgver}/
  install -m 644 ../dkms.conf "${pkgdir}"/usr/src/vhba-${pkgver}/
  install -m 644 ../60-vhba.rules "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et:
