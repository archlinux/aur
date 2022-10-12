# Maintainer: Elmer Skjødt Henriksen <esh@fjerhammer.dk>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us

pkgbase=aescrypt
pkgname=('aescrypt' 'aescrypt-gui')
pkgver=3.16
pkgrel=1
pkgdesc="Use AES256 (CBC mode, password SHA256 hashed) to encrypt files"
arch=('i686' 'x86_64')
url="http://www.aescrypt.com"
license=('GPL')
source=("https://www.aescrypt.com/download/v3/linux/${pkgbase}-${pkgver}.tgz")
sha256sums=('e2e192d0b45eab9748efe59e97b656cc55f1faeb595a2f77ab84d44b0ec084d2')

build() {
  cd ${srcdir}/${pkgbase}-${pkgver}/src
  make -j$(nproc)
}

package_aescrypt() {
  pkgdesc="Command line utility for encrypting files using AES"

  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/src/aescrypt" "${pkgdir}/usr/bin/aescrypt"
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/src/aescrypt_keygen" "${pkgdir}/usr/bin/aescrypt_keygen"
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/man/aescrypt.1" "${pkgdir}/usr/share/man/man1/aescrypt.1"

}

package_aescrypt-gui() {
  pkgdesc="Graphical user interface for AESCrypt"
  depends=('aescrypt' 'perl')
  optdepends=(
    'zenity: GTK-based password prompt'
    'kdialog: Qt-based password prompt'
  )
  
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/gui/aescrypt-gui"  "${pkgdir}/usr/bin/aescrypt-gui"
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/gui/AESCrypt.desktop" "${pkgdir}/usr/share/applications/AESCrypt.desktop"
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/gui/SmallLock.png" "${pkgdir}/usr/share/aescrypt/SmallLock.png"
}
