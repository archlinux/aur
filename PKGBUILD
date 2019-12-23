# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=actiona
pkgver=3.10.0
pkgrel=3
pkgdesc='A task automation tool that allows you to create and execute action lists'
arch=('x86_64')
url='https://wiki.actiona.tools'
license=('GPL3')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'libnotify' 'qt5-speech')
makedepends=('qt5-tools' 'boost' 'opencv')
source=("https://github.com/Jmgr/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('7f7a6ecef82ec51fc5d92e41a9d39d1de190135b1fb6293318feb1d88ceb8757'
            '92b1368978b1feb0620095a21b95737d93839ff4bf5f97ec2f1c2b2a1ab4f5ea')

prepare() {
  cd "${srcdir}"

  patch -p0 -i ../${pkgname}.patch
}


build() {
  cd "${pkgname}-${pkgver}"

  qmake-qt5 -r PREFIX=/usr PKGCONFIG_OPENCV=opencv4
  make
  make locale_release
}

package() {
  cd "${pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
}
