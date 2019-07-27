# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=java-openjfx-bin
_majorver=11
pkgver=11.0.2
pkgrel=3
pkgdesc="Java OpenJFX ${_majorver} client application platform."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=('ffmpeg' 'gstreamer' "java-environment>=${_majorver}" 'libxtst' 'qt5-base' 'webkit2gtk')
provides=("java-openjfx=$pkgver")
conflicts=("java-openjfx")
source=("https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-jmods.zip")
sha256sums=('40ef06cd50ea535d45403d9c44e9cb405b631c547734b5b50a6cb7b222293f97'
            'c6cabb90575f001cf81d917002b69f3d40a084fb3b450ab2364289e5ef1862ca')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cp -a "javafx-sdk-${pkgver}/lib" "${pkgdir}/${_jvmdir}/"
  mv "${pkgdir}/${_jvmdir}/lib/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk"
  cp -a "javafx-sdk-${pkgver}/legal" "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk/"
  # Jmods
  install -d "${pkgdir}/${_jvmdir}/jmods"
  cp -a "javafx-jmods-${pkgver}/"* "${pkgdir}/${_jvmdir}/jmods/"
}
# vim:set ts=2 sw=2 et:
