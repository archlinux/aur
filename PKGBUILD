# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=hdepanel-git
pkgver=v1.0.5.r0.gbd05f0a
pkgrel=1
pkgdesc="Qt5 based panel based on QtPanel"
arch=('i686' 'x86_64')
url="https://github.com/developing4all/hdepanel"
license=('GPL2')
depends=('libxcomposite' 'qt5-x11extras')
makedepends=('git')
provides=('hdepanel')
conflicts=('hdepanel')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd hdepanel
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd hdepanel
  qmake-qt5
  make
}

package() {
  cd hdepanel
  install -Dm755 hdepanel "${pkgdir}/usr/bin/hdepanel"
  install -d "${pkgdir}/usr/lib/hde/panel/plugins"
  cp -a libhdepanel* "${pkgdir}/usr/lib"
  cp -a plugins/lib*.so "${pkgdir}/usr/lib/hde/panel/plugins"
}
