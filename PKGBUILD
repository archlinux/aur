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
pkgver=20.4.1.407.0006
pkgrel=1
pkgdesc="A graphical tool for database development"
arch=("any")
url="https://www.oracle.com/tools/downloads/sqldev-downloads.html"
license=("custom:OTN")
depends=("bash" "freetype2" "java-environment>=8" "java-environment<=11")
optdepends=(
  "ksh"
  "java8-openjfx: Required to run the application with JDK8"
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
  "041709f01de2c6d176f37132089b61b8"
  "1d17d18e10ab85dead0770e8840273b3"
  "26c1dc933a9ab58a4245f4f351717645"
  "71a4092467209c160d0f34abbc08e049"
  "f321debd62e5da652ba1eba22937f2b2"
)
sha1sums=(
  "df90320a3a6e15df90fafb9d0c603317f3a68b84"
  "056bef8e3caa25e62c1395346c34f8a83c532aa8"
  "f33177179a2c6ea8b3fa8db5465dc36cf4317b1b"
  "524dfbd8baf17e348d529a831abf639029c56c7b"
  "593f81ab897ea7e15985b73c1ddff1a3717d02a4"
)
sha256sums=(
  "941135b2de75ffd27ef277b7e4538de4d8bdc4050dd2a87af05ce31b2bb7d95f"
  "bd028a137c83ab3698a562e9a7ec4006fb396178ab4a6ebdbaa60c75b5c0974c"
  "43b16049fbf85740767c45f0387a7c5e6118b8876509a8f0bb621ed0b5576a25"
  "7b3a6fd8a1ade4427382ee36dc28432655902a0a68547b29c5ce089bd85fe3de"
  "9b617ac2b83358a1e71dd98ddd618d4b0bae6584a8645359ef54cdcc6bc1ff55"
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
