# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>
pkgname=copay-bin
pkgver=4.6.2
pkgrel=1
pkgdesc="Copay is a secure bitcoin wallet platform for both desktop and mobile devices."
arch=('x86_64')
url="https://github.com/bitpay/copay"
license=('MIT')
groups=()
makedepends=()
optdepends=()
depends=('unzip')
provides=("copay")
conflicts=("copay")
replaces=()
backup=()
options=('!strip')
source=("Copay-$pkgver.zip::https://github.com/bitpay/copay/releases/download/v"$pkgver"/Copay-linux.zip"
        "copay.desktop"
        "512x512.png")
md5sums=('46d99250c9e78d3368b1a3c952bd4427'
         'e05610d1b08a2c688efccf9d687b8b92'
         '6b524738900ea4aee5e085d149d0304f')

package() {
  mkdir -p ${pkgdir}/opt/copay
  cd ${pkgdir}/opt/copay
  
  unzip "${srcdir}/Copay-$pkgver.zip"
 
  mv Copay-linux/* .
  mv Copay-linux/.[!.]* .
  rmdir Copay-linux
 
  find ${pkgdir}/opt/copay/ -type f -print0 | xargs -0 chmod a+r

  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/copay/Copay ${pkgdir}/usr/bin/copay

  mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}/copay.desktop" "$pkgdir/usr/share/applications/copay.desktop"
  install -m644 "${srcdir}/512x512.png" "$pkgdir/opt/copay/512x512.png"
  ln -s "../../../opt/copay/512x512.png" "$pkgdir/usr/share/pixmaps/copay.png" 
}
