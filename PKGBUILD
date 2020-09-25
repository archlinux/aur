# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
pkgver=3.5.0
pkgrel=1
pkgdesc='HUSH (fork of KMD) full node that supports zaddrs'
url='http://github.com/MyHush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MyHush/hush3/releases/download/v$pkgver/hush-$pkgver-linux-amd64.tar.gz")
sha256sums=('6a43ea10b2bf9cd8a719733db7e283a50d7af014cc644be1aa3e6b1b8282233d')

build() {
  tar xzvf $pkgname-$pkgver.tar.gz
}

package() {
  # create the necessary directory structure
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/hush"
  install -d "${pkgdir}/usr/bin"
 
  # rename KMD binaries used to not overwrite any installed
  mv komodo-cli hush-komodo-cli
  mv komodod hush-komodod
  mv komodo-tx hush-komodo-tx
 
  # install required scripts
  install -m 755 hush-cli "${pkgdir}/opt/${pkgname}"
  install -m 755 hushd "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-smart-chain "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-tx "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-komodo-cli "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-komodod "${pkgdir}/opt/${pkgname}"
  install -m 755 hush-komodo-tx "${pkgdir}/opt/${pkgname}"

  # install required sapling files
  install -m 644 sapling-output.params "${pkgdir}/opt/${pkgname}"
  install -m 644 sapling-spend.params "${pkgdir}/opt/${pkgname}"
 
  # links scripts to /usr/bin
  ln -s /opt/${pkgname}/hush-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hushd "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-smart-chain "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-tx "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-komodo-cli "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-komodod "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/hush-komodo-tx "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/sapling-output.params "${pkgdir}/usr/share/hush"
  ln -s /opt/${pkgname}/sapling-spend.params "${pkgdir}/usr/share/hush"
}
