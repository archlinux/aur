# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=actiona
pkgver=3.9.4
pkgrel=2
pkgdesc="A task automation tool that allows you to create and execute action lists"
arch=('x86_64')
url="https://wiki.actiona.tools"
license=('GPL3')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'opencv' 'libnotify')
makedepends=('qt5-tools' 'boost')
source=("https://github.com/Jmgr/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('e2537852548d34fa7407324b40b000ef30d8e5deef310ece7a4f938b6be3f185'
            'c95371a42dcc2186f06142bd08bce9d65e5c700b51bff8bbb939d5ef25ead899')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  qmake-qt5 -r PREFIX=/usr
  make
  make locale_release
}

package() {
  cd "${pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
}
