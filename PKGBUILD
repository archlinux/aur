# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=one-tomato
pkgver=1.0.4
pkgrel=1
pkgdesc="一个使用dtk实现的番茄钟"
arch=('x86_64')
url="https://github.com/uiYzzi/one-tomato"
license=('GPL3')
depends=('dtkwidget')
makedepends=('qconf')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/uiYzzi/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop::https://raw.githubusercontent.com/uiYzzi/one-tomato/master/dabao/extract/opt/apps/top.yzzi.tomato/entries/applications/top.yzzi.tomato.desktop"
        "${pkgname}.svg::https://raw.githubusercontent.com/uiYzzi/one-tomato/master/dabao/extract/opt/apps/top.yzzi.tomato/entries/icons/top.yzzi.tomato.svg")
sha256sums=('70a53d5e9f85a66863318f70455465b7c32c756ee76d93597fc4e49e5064dcb0'
            '624687f1759b5120ef6b18d56d7c05c03683d100fb36ccaa4198434d99248305'
            '1e8d671a4543852d2f7a7349dda1f27079a593d61a0c34598cab342bc6890ec1')

build() {
  cd ${pkgname}-${pkgver}
  
  mkdir -p build
  qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
  make -C ./build
}

package() {
  cd ${pkgname}-${pkgver}

  # binary
  install -Dm755 build/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # desktop enrty
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  sed -i "s|/opt/apps/top.yzzi.tomato/files/one-tomato|${pkgname}|g"  ${pkgdir}/usr/share/applications/${pkgname}.desktop
  sed -i "s|top.yzzi.tomato|${pkgname}|g" ${pkgdir}/usr/share/applications/${pkgname}.desktop

  #  icon
  install -Dm644 ${srcdir}/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}

# vim: set sw=2 ts=2 et:
