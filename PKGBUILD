# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apk-editor-studio
pkgver=1.4.0
pkgrel=1
pkgdesc="Powerful yet easy to use APK editor"
arch=('x86_64')
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kefir500/apk-editor-studio/archive/v${pkgver}.tar.gz"
        'deploy.pri.patch')
sha256sums=('62f2830a282f44d4860330a8f371b1ac27676257fe39a70f6203d34a6633a5e5'
            'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch < "${srcdir}/deploy.pri.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  qmake PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr"
  cp -R bin/linux/bin "${pkgdir}/usr"
  cp -R bin/linux/share "${pkgdir}/usr"
  chown -R root:root "${pkgdir}/"
}
# vim:set ts=2 sw=2 et: