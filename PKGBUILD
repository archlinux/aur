# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=hexinject
pkgver=1.6
pkgrel=1
pkgdesc="Network packet sniffer and injector"
arch=('x86_64')
url="http://hexinject.sourceforge.net/"
license=("BSD")
depends=("libpcap" "tcl")
source=("${pkgname}-${pkgver}.tar.gz"::"http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "hexinject-1.6-fix-build-system.patch")
sha256sums=('06e64636923af593c742129d81b717667223bff39918f26bf56809ead9700e65'
            'cb410b131fd447f8b18b2e69bd35a0ae79df1689eb32f8ff97365eb8e250e8c5')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/hexinject-1.6-fix-build-system.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 ${pkgdir}/usr/bin
  for i in hexinject hex2raw prettypacket packets.tcl; do
    install -m755 ${i} ${pkgdir}/usr/bin/${i}
  done
}
