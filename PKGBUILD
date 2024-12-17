# Maintainer:  Malek Camilo <malek.camilo@gmail.com>
# Contributor: Matt Parnell <parwok@gmail.com>
# Contributor: Fredy García <frealgagu@gmail.com>
# Contributor: Yan Doroshenko <yandoroshenko@protonmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: ptk042 <ptk042@gmail.com>
# Contributor: mmm <markotahal@gmail.com>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: David Fuhr <david.fuhr@web.de>

pkgname=oracle-sqldeveloper
pkgver=24.3.1.347.1826
pkgrel=1
pkgdesc="A graphical tool for database development"
arch=("any")
url="https://www.oracle.com/tools/downloads/sqldev-downloads.html"
license=("custom:OTN")
depends=("bash" "freetype2" "java-environment=17")
optdepends=(
  "ksh"
  "java17-openjfx: Required to run the application with JDK17"
)
install="${pkgname}.install"
source=(
  "https://download.oracle.com/otn_software/java/sqldeveloper/${pkgname#oracle-}-${pkgver}-no-jre.zip"
  "${pkgname}.desktop"
  "${pkgname}.sh"
  "LICENSE"
  "java_home.patch"
)
md5sums=(
  "7de67da92e557e6cc3f8104c9fad951e"
  "1d17d18e10ab85dead0770e8840273b3"
  "26c1dc933a9ab58a4245f4f351717645"
  "9919d8008722306b90a60a62f3bd75de"
  "f732d162c751dc096bbe0e0f96b78754"
)
sha1sums=(
  "38cab3650bcc67cd8af4f7ca54a6a5413bbba61c"
  "056bef8e3caa25e62c1395346c34f8a83c532aa8"
  "f33177179a2c6ea8b3fa8db5465dc36cf4317b1b"
  "7cd71b0e3ea42b5bf520af7b796d78af5206843f"
  "f78dd599d2804dedabccf6e1746aa9bb27c2b7ee"
)
sha256sums=(
  "3390ef58972f1f255077c49e66b171b8664773bb16e37570a7ca16acc5afb8cb"
  "bd028a137c83ab3698a562e9a7ec4006fb396178ab4a6ebdbaa60c75b5c0974c"
  "43b16049fbf85740767c45f0387a7c5e6118b8876509a8f0bb621ed0b5576a25"
  "2213ed6e2c1a355736728584379504eef6997f849852c61211e2719d6dd50f03"
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
