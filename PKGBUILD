# Maintainer: GT610 <myddz1005@163.com>

pkgname=keyviz
pkgver=2.0.0a
pkgrel=1
pkgdesc="A free and open-source tool to visualize your keystrokes keyboard in real-time (Official GNU/Linux build)"
arch=('x86_64')
url="https://github.com/mulaRahul/keyviz"
license=('GPL')
makedepends=('flutter')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/mulaRahul/keyviz/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('4c68eca73b475ec1a9560a8ce7846eb7')
sha256sums=('aa6b7bc611d26d99a99dd842fdabc195f5fd8243297655737d1a6351476081b8')

build() {
  cd "${pkgname}"-"${pkgver}"
  flutter pub get
  flutter build linux
}

package() {
  mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/applications "${pkgdir}"/usr/share/icons
  cp -r "${pkgname}"-"${pkgver}"/build/linux/x64/release/bundle/* "${pkgdir}"/usr/bin
  cp ../keyviz.desktop "${pkgdir}"/usr/share/applications
  cp ../keyviz-icon.xpm "${pkgdir}"/usr/share/icons
  chmod +x "${pkgdir}"/usr/bin/keyviz
  echo "Currently keyviz for GNU/Linux is in alpha release. It may not work properly or have some bugs. \
  For any issues about the application itself, please refer to https://github.com/mulaRahul/keyviz/issues."
}