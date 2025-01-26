# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>
pkgname=open-android-backup
pkgver=1.0.19
pkgrel=1
pkgdesc='A complete, easy to use script that lets you locally backup and restore your Android device.'
arch=(i686 x86_64)
license=(GPL-3.0-only)
url='https://www.openandroidbackup.me'
depends=(
  android-tools
  bc
  curl
  libnewt
  p7zip
  pv
  zenity
)
optdepends=(
  'secure-delete: securely delete data in the temporary folder'
)
source=("${pkgname}-${pkgver}.zip::https://github.com/mrrfv/${pkgname}/releases/download/v${pkgver}/Open_Android_Backup_v${pkgver}_Bundle.zip")
sha512sums=('c3ad19faca3a81816d664cde699b455641efdf1e2ca3e61826d5838ebf3f1c2fb6ac28d12a56bdd87498b80d2d2dcccc173af2d67e7919fe9b5777856f94e8db')

package () {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  #cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,windows-dependencies,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"
  cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"

  install -Dm755 "$srcdir/backup.sh" "${pkgdir}/opt/${pkgname}/backup.sh"
  install -Dm644 "$srcdir/hooks.example.sh" "${pkgdir}/opt/${pkgname}/hooks.example.sh"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/backup.sh" "${pkgdir}/usr/bin/${pkgname}"
}
