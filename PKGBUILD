# Maintainer: Carmelo Pellegrino <carmelo.pellegrino@gmail.com>

pkgname=xfce4-i3-window-title-plugin-git
pkgrel=1
pkgver=0.0.1.r1.gbdb9290
pkgdesc="An i3wm-aware window-title plugin for xfce4-panel"
arch=('i686' 'x86_64' 'armv7l')
url="https://github.com/carmelopellegrino/xfce4-i3-window-title-plugin"
source=("${pkgname}::git+https://github.com/carmelopellegrino/xfce4-i3-window-title-plugin")
md5sums=('SKIP')
license=('GPLv3')
depends=('xfce4-panel' 'i3ipc-glib-git')
makedepends=('git' 'autoconf' 'automake' 'xfce4-dev-tools')
provides=('xfce4-i3-window-title-plugin')

build() {
  cd "${pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -v -D -m 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
