# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=java-openjfx-ea-bin
_majorver=11
_buildver=25
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} Early-Access Build from Oracle."
arch=('x86_64')
url='http://jdk.java.net/openjfx/'
license=('GPL2')
depends=('java-openjdk-ea-bin' 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
_srcurl="https://download.java.net/java/early_access/openjfx${_majorver}/${_buildver}/binaries/openjfx-${_majorver}-ea+${_buildver}"
source=("${_srcurl}_linux-x64_bin-sdk.zip"
        "${_srcurl}_linux-x64_bin-jmods.zip"
        "${_srcurl}_doc-api.zip"
)
sha256sums=('c149c4e346377fca1e474a915479d60774cad00b05048397dd2c62675a4f68ea'
            'a0147e4c919cecc89479a387a47ec289c2fd909d8278a3e379a6bef53a9e0e6c'
            '52e38f360fd0e5665e858ac4681164c0162338a17f1ed1a4b3b91111cfe8be80')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk-ea

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cp -a "javafx-sdk-${_majorver}/lib" "${pkgdir}/${_jvmdir}/"
  mv "${pkgdir}/${_jvmdir}/lib/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk-ea"
  cp -a "javafx-sdk-${_majorver}/legal" "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk-ea/"
  # Jmods
  install -d "${pkgdir}/${_jvmdir}/jmods"
  cp -a "javafx-jmods-${_majorver}/"* "${pkgdir}/${_jvmdir}/jmods/"
  # Docs
  install -d "${pkgdir}/usr/share/doc/openjfx-ea"
  cp -a "javafx-docs-${_majorver}/"* "${pkgdir}/usr/share/doc/openjfx-ea/"
}
# vim:set ts=2 sw=2 et:
