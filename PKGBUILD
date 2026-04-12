# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>

# shellcheck disable=SC2148,SC2034,SC2154,SC2164

pkgname=open-android-backup
pkgver=1.2.3
pkgrel=1
pkgdesc='A complete, easy to use script that lets you locally backup and restore your Android device.'
arch=(i686 x86_64)
license=(GPL-3.0-only)
url='https://mrrfv.github.io/open-android-backup/'
depends=(
  android-tools
  bc
  curl
  libnewt
  p7zip
  pv
)
optdepends=(
  'srm: securely delete data in the temporary folder'
  'zenity: display graphical dialogs'
)
source=("${pkgname}-${pkgver}.zip::https://github.com/mrrfv/${pkgname}/releases/download/v${pkgver}/Open_Android_Backup_v${pkgver}_Bundle.zip")
sha512sums=('cbd3b966222054a7c0a5b428e8157284a8547a296d906cb4d1256278c9318c76e62bae6c9edd6ccd54ae9c339eb704ee062ef2cc27016f08ec0d6a0e93d9ddf9')

package () {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  #cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,windows-dependencies,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"
  cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,*.apk,README.*} "${pkgdir}/opt/${pkgname}/"

  install -Dm755 "$srcdir/backup.sh" "${pkgdir}/opt/${pkgname}/backup.sh"
  install -Dm644 "$srcdir/hooks.example.sh" "${pkgdir}/opt/${pkgname}/hooks.example.sh"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/backup.sh" "${pkgdir}/usr/bin/${pkgname}"
}
