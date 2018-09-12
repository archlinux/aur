# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-no-title-bar-git
_gitname=no-title-bar
pkgver=v8.r20.g54ea99c
pkgrel=0
pkgdesc="No Title Bar removes the title bar, moves the window title and buttons to the top panel."
arch=('any')
url="https://github.com/franglais125/no-title-bar"
license=('GPL2')
depends=('gnome-shell' 'xorg-xprop')
makedepends=('git')
provides=('gnome-shell-extension-no-title-bar-git')
conflicts=('gnome-shell-extension-no-title-bar' 'gnome-shell-extension-pixel-saver' 'gnome-shell-extension-pixel-saver-git')
install=${pkgname%-*}.install
source=('git+https://github.com/franglais125/no-title-bar.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _extid="no-title-bar@franglais125.gmail.com"
  cd "${srcdir}/${_gitname}"
  make _build
  mv _build ${_extid}
  
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-*}"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -af "${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
