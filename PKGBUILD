# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Maintainer: Dan Panzarella <alsoelp@gmail.com>

pkgname=awesomebump
pkgver=4.0
pkgrel=1
pkgdesc="A free program designed to generate normal, height, specular or ambient occlusion textures from a single image"
arch=('i686' 'x86_64')
url="http://awesomebump.besaba.com/"
license=('LGPL3')
depends=('qt5-base')
makedepends=('imagemagick')
source=("https://github.com/kmkolasinski/AwesomeBump/archive/Linuxv${pkgver}.tar.gz"
        "awesomebump.desktop")
md5sums=('7fa501fb9e18dc72d220472c12ae5cf4'
         'a798a1946042f5c06505043100a32e28')

build() {
  cd "${srcdir}/AwesomeBump-Linuxv${pkgver}/Sources"

  qmake-qt5 -config release
  make
}

package() {
  cd "${srcdir}/AwesomeBump-Linuxv${pkgver}"

  install -Dm755 "Sources/AwesomeBump" "${pkgdir}/opt/awesomebump/AwesomeBump"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/awesomebump/AwesomeBump" "${pkgdir}/usr/bin/AwesomeBump"
  cp -r "Bin/Configs" "Bin/Core" "${pkgdir}/opt/awesomebump"
  convert Sources/icon.ico awesomebump.png
  install -Dm644 "awesomebump.png" "${pkgdir}/usr/share/pixmaps/awesomebump.png"
  install -Dm644 "${srcdir}/awesomebump.desktop" "${pkgdir}/usr/share/applications/awesomebump.desktop"
}
