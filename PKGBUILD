# Maintainer: Nick Cao <nickcao@nichi.co>

pkgbase=jool
pkgname=(jool-tools jool-dkms)
pkgver=4.0.7
pkgrel=2
pkgdesc="Open Source SIIT and NAT64 for Linux."
arch=('x86_64')
url="https://www.jool.mx"
license=('GPL2')
source=("https://github.com/NICMx/Jool/releases/download/v${pkgver}/jool-${pkgver}.tar.gz")
sha512sums=('adc269c75b7195fbb6de04ecc50824b464644bcaf1ba00634912cbdc21308b872273f4dc5b866f2af9dfd58fedf624e77e0ddaf68403447e6749f7fd0e50146f')

prepare(){
  cp -a jool-${pkgver} jool-dkms-${pkgver}
}

build() {
  cd jool-${pkgver}
  ./configure --prefix=/usr
  make
}

package_jool-tools() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Userspace tools and libraries"
  depends=('libnl')
  cd jool-${pkgver}
  make DESTDIR="${pkgdir}" install
}

package_jool-dkms() {
  pkgdesc="Open Source SIIT and NAT64 for Linux. - Kernel modules"
  depends=('dkms')
  optdepends=('linux-headers: Build the module for Arch kernel'
              'linux-lts-headers: Build the module for LTS Arch kernel')
  install -dm 755 "${pkgdir}"/usr/src
  cp -dr --no-preserve='ownership' jool-dkms-${pkgver} "${pkgdir}/usr/src/jool-${pkgver}" 
}

