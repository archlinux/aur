#Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=pkcrack
pkgver=1.2.2
pkgrel=4
pkgdesc="An algorithm for breaking the PkZip cipher that was devised by Eli Biham and Paul Kocher."
arch=('i686' 'x86_64')
url="https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack.html"
license=('custom')
conflicts=('libextractor')
depends=('glibc')
source=("https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack/pkcrack-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('4d2dc193ffa4342ac2ed3a6311fdf770ae6a0771226b3ef453dca8d03e43895a'
            'c7243221bf8692cef82dadcf4db0e2c64a845b2373eb8b5827e8db512a0e4e84')
install=pkcrack.install

build() {
  cd ${pkgname}-${pkgver}/src
  make
}

package() {
  # license
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # bin
  cd ${pkgname}-${pkgver}
  install -Dm755 src/extract ${pkgdir}/usr/bin/extract
  install -Dm755 src/findkey ${pkgdir}/usr/bin/findkey
  install -Dm755 src/makekey ${pkgdir}/usr/bin/makekey
  install -Dm755 src/pkcrack ${pkgdir}/usr/bin/pkcrack
  install -Dm755 src/zipdecrypt ${pkgdir}/usr/bin/zipdecrypt

  # doc
  install -d ${pkgdir}/usr/share/doc
  cp -R doc ${pkgdir}/usr/share/doc/pkcrack
}
