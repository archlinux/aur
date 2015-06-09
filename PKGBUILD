# Maintainer: Christoph Korn <c_korn at gmx dot de>
pkgname=chatty
pkgver=0.8
pkgrel=1
pkgdesc="Twitch Chat Client for Desktop"
arch=('any')
url="http://getchatty.sourceforge.net" 
license=('MIT')
depends=('java-environment' 'sh')
optdepends=('livestreamer: for watching streams in a custom video player.')
makedepends=('apache-ant' 'jre7-openjdk')

source=("http://downloads.sourceforge.net/getchatty/Chatty_${pkgver}_source.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}_script"
        "config_dir.patch"
        "client_id.patch"
        "manifest.patch"
        "disable_version_check.patch"
        "build.patch")
md5sums=('05f1ea3a948719a89127f7feb9c0aa42'
         '2bdf69cd81d941dba97d55694f9da26d'
         '9d8950b786e1af5614bc705ad478b019'
         '8f74b121a39705a33687ddf26dfdd2ac'
         '6464228eceee06c4f8987df9b44bab65'
         '2dd48d545926d8e9d5ab56df46dc09d3'
         'c6360077b684607a765f50a23006bbff'
         '806ddd5794c5441b07733be4229bf9d2'
         '79752de0a1a4dcc15067d9c33214ca3f')

prepare() {
  patch -p1 -i $srcdir/build.patch
  patch -p1 -i $srcdir/client_id.patch
  patch -p1 -i $srcdir/config_dir.patch
  patch -p1 -i $srcdir/disable_version_check.patch
  patch -p1 -i $srcdir/manifest.patch
}

build() {
  ant
}

package(){
  install -Dm644 "${srcdir}/dist/${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/sounds" "${pkgdir}/usr/share/${pkgname}/"

  install -Dm755 "${srcdir}/${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/APACHE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/APACHE_LICENSE"
  install -Dm644 "${srcdir}/LGPL" "${pkgdir}/usr/share/licenses/${pkgname}/LGPL"
  install -Dm644 "${srcdir}/README" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}

