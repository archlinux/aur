# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>
pkgname=open-android-backup
pkgver=1.2.0
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
  zenity
)
optdepends=(
  'srm: securely delete data in the temporary folder'
)
source=("${pkgname}-${pkgver}.zip::https://github.com/mrrfv/${pkgname}/releases/download/v${pkgver}/Open_Android_Backup_v${pkgver}_Bundle.zip")
sha512sums=('ab600d585a67292449df1e23e187430b94f9d202507f936690172d4927493e45b38f048fece7b1ffd8c64dd6678e6ff05374b0811e703bf5ac8397d1bbbae1a2')

package () {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  #cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,windows-dependencies,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"
  cp -dr --no-preserve=ownership "$srcdir"/{extras,functions,*.apk,LICENSE,README.*} "${pkgdir}/opt/${pkgname}/"

  install -Dm755 "$srcdir/backup.sh" "${pkgdir}/opt/${pkgname}/backup.sh"
  install -Dm644 "$srcdir/hooks.example.sh" "${pkgdir}/opt/${pkgname}/hooks.example.sh"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/backup.sh" "${pkgdir}/usr/bin/${pkgname}"
}
