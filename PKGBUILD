# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush3-bin
_pkgname=hush3
pkgver=3.6.0
pkgrel=1
pkgdesc='HUSH (Privacy Cryptocurrency and Messenger) full node that supports z-addresses'
url='http://git.hush.is/hush/hush3'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'lib32-zlib')
makedepends=('wget' 'git' 'curl')
conflicts=('hush3')
source=("$_pkgname-$pkgver.tar.gz::https://git.hush.is/attachments/e163324a-52eb-4c4c-9c34-0a18c3748f0a"
  "sapling-output.params::https://git.hush.is/attachments/e813da7d-ecec-4c78-b0fb-40d505689e2b"
  "sapling-spend.params::https://git.hush.is/attachments/dc290d37-64d3-41e8-ae83-df364cb0ba3c")
sha256sums=('9c2f19c50fdc44af2c89494b06cda2c9e176d7ae2f038ca0fb7c0cd083dd71b9'
  '2f0ebbcbb9bb0bcffe95a397e7eba89c29eb4dde6191c339db88570e3f3fb0e4'
  '8e48ffd23abb3a5fd9c5589204f32d9c31285a04b78096ba40a79b75677efc13')

build() {
  tar xzvf $_pkgname-$pkgver.tar.gz
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
