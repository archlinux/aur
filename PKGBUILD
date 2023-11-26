# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apk-editor-studio
pkgver=1.7.1
pkgrel=1
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
makedepends=('qt5-base' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kefir500/apk-editor-studio/archive/v${pkgver}.tar.gz")
sha256sums=('676d236c8025ae1b1ac15e9ebe0617eba1fb7bb7a2728841e6bbab451174d5c9')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B ./build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="/usr/lib/qt"
  cmake --build ./build --config Release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/bin/apk-editor-studio -t "${pkgdir}/usr/bin/"
  install -Dm644 dist/linux/share/applications/* -t "${pkgdir}/usr/share/applications/"
  cp -r dist/linux/share/icons/ "${pkgdir}/usr/share/"
}
# vim:set ts=2 sw=2 et:
