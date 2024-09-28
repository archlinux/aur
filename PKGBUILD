# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>
pkgname=open-android-backup
pkgver=1.0.18
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
sha512sums=('3c841636f5db854484aa0310a9323b0a509b4475122746572c1aa2179c5be6b61dcd050391562533e7faa3a3c27234c1896b3f39aca1d8d6bd55779ee356df8b')

package () {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  #cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,windows-dependencies,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"
  cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"

  install -Dm755 "$srcdir/backup.sh" "${pkgdir}/opt/${pkgname}/backup.sh"
  install -Dm644 "$srcdir/hooks.example.sh" "${pkgdir}/opt/${pkgname}/hooks.example.sh"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/backup.sh" "${pkgdir}/usr/bin/${pkgname}"
}
