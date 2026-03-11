# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>

# shellcheck disable=SC2148,SC2034,SC2154,SC2164

pkgname=open-android-backup
pkgver=1.2.2
pkgrel=2
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
sha512sums=('d526316ddf1e21d96f7ef8102f769ce396fb6026e29d4ab28af76d3f0a9d5ea3f3aa47732b701a545f3eb51623e525a4f2f801cbac83b923fff5ac62804fca92')

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
