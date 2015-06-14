# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-terminal
pkgver=1.1.20141230110750
_srcdirname=deepin-terminal-1.1+20141230110750~bc441b7aae
pkgrel=1
pkgdesc='Awesome terminal for Linux Deepin'
arch=('any')
url="https://gitcafe.com/Deepin/deepin-terminal"
license=('GPL3')
depends=('deepin-vte' 'python2-dbus' 'python2-scipy')
makedepends=('deepin-gettext-tools')
groups=('deepin-extra')
install="${pkgname}.install"
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-terminal/deepin-terminal_1.1+20141230110750~bc441b7aae.tar.gz")
sha256sums=('e8f756064def8b69a2e3c63f8cb0e1070082da997862ee0ecaa2b5b84be1d1e7')

prepare(){
  cd "${_srcdirname}"

  # fix python version
  find "${srcdir}" -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build() {
  cd "${_srcdirname}"

  deepin-generate-mo tools/locale_config.ini
}

package() {
  depends+=('python2-deepin-ui' 'gtk-update-icon-cache')

  cd "${_srcdirname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
