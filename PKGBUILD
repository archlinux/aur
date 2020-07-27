# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=komodo-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Komodo (KMD) full node that supports zaddrs'
url='https://github.com/KomodoPlatform/komodo'
arch=('x86_64')
license=('GPL2')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('komodo')
source=("https://github.com/KomodoPlatform/komodo/releases/download/$pkgver/komodo_linux_$pkgver.tar.gz")
sha256sums=('ce3d567ca9b56553d85833b92870fc865378848be81234056175b0f9a37e4412')

build() {
  tar xzvf komodo_linux_$pkgver.tar.gz
  cd linux64
  # fetch required sapling files
  ./fetch-params.sh
}

package() {
  # create the necessary directory structure
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
 
  # install required scripts
  install -m 755 linux64/komodod "${pkgdir}/opt/${pkgname}"
  install -m 755 linux64/komodo-cli "${pkgdir}/opt/${pkgname}"

  # links scripts to /usr/bin
  ln -s /opt/${pkgname}/komodod "${pkgdir}/usr/bin"
}
