# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apk-editor-studio-1.7
_pkgname=apk-editor-studio
pkgver=1.7.1
pkgrel=1
pkgdesc="Powerful yet easy to use APK editor"
arch=('x86_64' 'aarch64')
url='https://qwertycube.com/apk-editor-studio'
license=('GPL3')
depends=('qt5-base'
         'java-runtime>=8'
         'hicolor-icon-theme'
         'android-sdk-build-tools'
         'android-sdk-platform-tools'
         'android-apktool')
optdepends=('libsecret: Enable password manager backend')
makedepends=('qt5-base')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/kefir500/apk-editor-studio/archive/v${pkgver}.tar.gz"
        'deploy.pri.patch')
sha256sums=('676d236c8025ae1b1ac15e9ebe0617eba1fb7bb7a2728841e6bbab451174d5c9'
            '5099d3afb6026a8646a22e5c9b0b7ca03b7f2cc614df2e1f3b5a5df4d8e46c4d')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch < "${srcdir}/deploy.pri.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  qmake PREFIX=/usr ..
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr"
  cp -R bin/linux/bin "${pkgdir}/usr"
  cp -R bin/linux/share "${pkgdir}/usr"
  chown -R root:root "${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
