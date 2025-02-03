# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apk-editor-studio
pkgver=1.7.2
pkgrel=4
pkgdesc="Powerful yet easy to use APK editor"
arch=('x86_64')
url='https://qwertycube.com/apk-editor-studio'
license=('GPL3')
depends=('qt5-base'
         'java-runtime>=8'
         'hicolor-icon-theme'
         'android-tools'
         'android-sdk-build-tools'
         'android-apktool')
optdepends=('libsecret: Enable password manager backend')
makedepends=('qt5-base' 'qt5-tools' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kefir500/apk-editor-studio/archive/v${pkgver}.tar.gz")
sha256sums=('6227b8f54ae897724120ac866753f689745b568227a5ee0a11d3f686629dcafd')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B ./build -DCMAKE_BUILD_TYPE=Release
  cmake --build ./build
}

package() {
   cd "${pkgname}-${pkgver}"
   cmake --install ./build --prefix="${pkgdir}/usr"
   ln -s /usr/share/android-apktool/apktool.jar "${pkgdir}/usr/share/apk-editor-studio/tools/"
   ln -s /opt/android-sdk/build-tools/*/lib/apksigner.jar "${pkgdir}/usr/share/apk-editor-studio/tools/"
}
# vim:set ts=2 sw=2 et:
