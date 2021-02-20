# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=one-tomato
pkgver=1.0.4
pkgrel=2
pkgdesc="一个使用dtk实现的番茄钟"
arch=('x86_64')
url="https://github.com/uiYzzi/one-tomato"
license=('GPL3')
depends=('dtkwidget')
makedepends=('qconf')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/uiYzzi/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg::https://raw.githubusercontent.com/uiYzzi/one-tomato/master/dabao/extract/opt/apps/top.yzzi.tomato/entries/icons/top.yzzi.tomato.svg")
sha256sums=('70a53d5e9f85a66863318f70455465b7c32c756ee76d93597fc4e49e5064dcb0'
            '3772f787950809b62534cbf3bdd69c36297ff15c2ffc80517e6456103bf72990'
            '1e8d671a4543852d2f7a7349dda1f27079a593d61a0c34598cab342bc6890ec1')

build() {
  cd ${pkgname}-${pkgver}
  
  qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
  make -C ./build
}

package() {
  cd ${pkgname}-${pkgver}

  # binary
  install -Dm755 build/one-tomato -t ${pkgdir}/usr/bin/

  # desktop entry
  install -Dm644 ${srcdir}/one-tomato.desktop -t ${pkgdir}/usr/share/applications/

  # icon
  install -Dm644 ${srcdir}/one-tomato.svg -t  ${pkgdir}/usr/share/pixmaps/
}

# vim: set sw=2 ts=2 et:
