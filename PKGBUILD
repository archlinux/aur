# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Yan Doroshenko <yandoroshenko@protonmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: ptk042 <ptk042@gmail.com>
# Contributor: mmm <markotahal@gmail.com>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: David Fuhr <david.fuhr@web.de>

pkgname=oracle-sqldeveloper
pkgver=23.1.1.345.2114
pkgrel=1
pkgdesc="A graphical tool for database development"
arch=("any")
url="https://www.oracle.com/tools/downloads/sqldev-downloads.html"
license=("custom:OTN")
depends=("bash" "freetype2" "java-environment=11")
optdepends=(
  "ksh"
  "java11-openjfx: Required to run the application with JDK11"
)
install="${pkgname}.install"
source=(
  "manual://${pkgname#oracle-}-${pkgver}-no-jre.zip"
  "${pkgname}.desktop"
  "${pkgname}.sh"
  "LICENSE"
  "java_home.patch"
)
md5sums=(
  "dc13da11f837a5f9c64187f52afb1ffe"
  "1d17d18e10ab85dead0770e8840273b3"
  "26c1dc933a9ab58a4245f4f351717645"
  "71a4092467209c160d0f34abbc08e049"
  "f732d162c751dc096bbe0e0f96b78754"
)
sha1sums=(
  "b320870ca846858e5abfc3b3e010fc5e9040dd05"
  "056bef8e3caa25e62c1395346c34f8a83c532aa8"
  "f33177179a2c6ea8b3fa8db5465dc36cf4317b1b"
  "524dfbd8baf17e348d529a831abf639029c56c7b"
  "f78dd599d2804dedabccf6e1746aa9bb27c2b7ee"
)
sha256sums=(
  "ae84622086392ab29d235aa5c9cadfef976f5b1453a0c301a007f74c005d92e5"
  "bd028a137c83ab3698a562e9a7ec4006fb396178ab4a6ebdbaa60c75b5c0974c"
  "43b16049fbf85740767c45f0387a7c5e6118b8876509a8f0bb621ed0b5576a25"
  "7b3a6fd8a1ade4427382ee36dc28432655902a0a68547b29c5ce089bd85fe3de"
  "81f46da274adb392ed2c7118d7cae0030521134b9db1d10313ff1df6486fe8b2"
)

prepare() {
  cd "${srcdir}/${pkgname#oracle-}"
  patch -Np1 -i "${srcdir}/java_home.patch"
}

package() {
  cd "${srcdir}/${pkgname#oracle-}"

  find . \( -iname "*.exe" -o -iname "*.dll" \) -exec rm -f "{}" +
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
  chmod +x "${pkgdir}/opt/${pkgname}/${pkgname#oracle-}.sh"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
