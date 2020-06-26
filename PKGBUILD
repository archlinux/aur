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
pkgver=20.2.0.175.1842
pkgrel=1
pkgdesc="A graphical tool for database development"
arch=("any")
url="https://www.oracle.com/tools/downloads/sqldev-downloads.html"
license=("custom:OTN")
depends=("bash" "java-environment>=8" "java-environment<=11")
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
  "457dd75e626695b3262f38ea4f65c350"
  "1d17d18e10ab85dead0770e8840273b3"
  "26c1dc933a9ab58a4245f4f351717645"
  "71a4092467209c160d0f34abbc08e049"
  "26037c8c9c7a285896397c058188eed4"
)
sha1sums=(
  "79810d37bf8c442f975323215236abffef5a8ab0"
  "056bef8e3caa25e62c1395346c34f8a83c532aa8"
  "f33177179a2c6ea8b3fa8db5465dc36cf4317b1b"
  "524dfbd8baf17e348d529a831abf639029c56c7b"
  "4833afbd50b74e26f34c8b8dc70cbc5095b0cf14"
)
sha256sums=(
  "f6f87fe4a30fdb6039f1a7cb2701739b8614845e7edc9d8f2b0307ebdcc18ab9"
  "bd028a137c83ab3698a562e9a7ec4006fb396178ab4a6ebdbaa60c75b5c0974c"
  "43b16049fbf85740767c45f0387a7c5e6118b8876509a8f0bb621ed0b5576a25"
  "7b3a6fd8a1ade4427382ee36dc28432655902a0a68547b29c5ce089bd85fe3de"
  "c3409397f49dbf7021ef6912ddac51d5aeddc5a5b748d9524b568d60f5ed6c6a"
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
