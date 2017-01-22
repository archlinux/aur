# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=emojione-picker-git
pkgver=0.1.r37.gcb5f504
pkgrel=4
pkgdesc='Emoji picker based on icons by Emojione '
arch=('any')
url='https://github.com/gentakojima/emojione-picker-ubuntu'
license=('GPL3;cc-by-4.0')
depends=('python2' 'python2-gobject' 'libappindicator-gtk3')
makedepends=('git')
source=('git+https://github.com/gentakojima/emojione-picker-ubuntu.git')
sha256sums=('SKIP')

pkgver() {
  cd 'emojione-picker-ubuntu'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd 'emojione-picker-ubuntu'
  # remove hard-coded install paths, warnings and confirmations
  <install.sh sed 's/^\W*_INSTALL_PREFIX=.*/true/' | grep '^\W*_AUTOSTART_DIR=' -v | grep '^\W*_APP_DIR=' -v | grep 'the program will be installed just for the current user.' -v | grep 'Press enter to install' -v | grep echo -v > install_for_pkgbuild.sh
  chmod +x install_for_pkgbuild.sh
}

package() {
  cd 'emojione-picker-ubuntu'
  export _INSTALL_PREFIX="${pkgdir}/usr/"
  export _AUTOSTART_DIR="${pkgdir}/etc/xdg/autostart"
  export _APP_DIR="${pkgdir}/usr/share/applications"
  ./install_for_pkgbuild.sh
}
