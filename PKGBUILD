# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-game-center
pkgver=1.0.1.20141230144448
_srcdirname=deepin-game-center-1.0.1+20141230144448~4e7bbbfda6
pkgrel=1
pkgdesc="Game center for Linuxdeepin"
arch=('any')
url="https://gitcafe.com/Deepin/deepin-game"
license=('GPL3')
depends=('python2')
makedepends=('deepin-gettext-tools')
groups=('deepin-extra')
install="${pkgname}.install"
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-game-center/deepin-game-center_1.0.1+20141230144448~4e7bbbfda6.tar.gz")
sha256sums=('cefa9548840757af0fa6c07b98924de2a9860327d85b0d86f4cca710ff8f8a3f')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build() {
  cd "${_srcdirname}"

  deepin-generate-mo tools/locale_config.ini
}

package() {
  depends=('python2-deepin-ui' 'flashplugin' 'hicolor-icon-theme' 'python2-scipy' 'python2-jswebkit')

  cd "${_srcdirname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
