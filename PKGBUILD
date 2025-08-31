# Maintainer: Charlie83 <dev at charlie83 dot com>
# Based on android-emulator by Hai Zhang

pkgname=android-desktop-head-unit
_major=2
_minor=1
_micro=1
pkgver=r2.0.0
pkgrel=1

pkgdesc='Desktop Head Unit emulator for Android Auto development'
arch=('x86_64')
url="https://developer.android.com/training/cars/testing/dhu"
license=('custom')
depends=('libusb')

source=("https://dl-ssl.google.com/android/repository/desktop-head-unit-linux-x64_r0$_major.$_minor.zip"
        "package.xml"
        "${pkgname}.sh"
        "${pkgname}.csh")
sha512sums=('e2cd5b6a95881461857a6f50ea10a21bd7f0b27160841bb0d6fcc20b56c1aa02bde9b3dc9ffa54301ce73e6296e49bf0ce177e2a5dc4ba85040ce1cc87d6cbe9'
            '1553abffe07c44fd8ab022669bddd483709980d59f8125aacc45d2958f9c7d4509635872e30356746a31c82c3986e4987c38b13f2e99830d3b13e96aa31dcfd1'
            '8be4a3e162199d813c702eef6411e1a126c948d0550b5c82d75d35aef0f076f2ad671042d168164520c39012cbe54898c80b36412709ac4e2239f6937b0bcfa3'
            '9d7b628919653875fea22ec263a1a9eb655e5496a03a340e204e526276674911d426714b7098512a092328d36c24ea683ff22129934296c5587a8249bdbe0861')
options=('!strip')

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.csh"

  install -d "${pkgdir}/opt/android-sdk/desktop-head-unit"
  cp -a desktop-head-unit "${pkgdir}/opt/android-sdk/desktop-head-unit"
  install -Dm755 'package.xml' "${pkgdir}/opt/android-sdk/desktop-head-unit/package.xml"

  # Fix broken permissions
  #chmod -R o=g "${pkgdir}/opt/android-sdk/desktop-head-unit"
  #find "${pkgdir}/opt/android-sdk/desktop-head-unit" -perm 744 -exec chmod 755 {} +
}

# see https://dl.google.com/android/repository/repository2-1.xml for new versions
# vim:set ts=2 sw=2 et:
