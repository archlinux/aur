# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-easyscreencast-origin-git
_gitname=EasyScreenCast
pkgver=1.0.0.r0.g314eda4
pkgrel=0
pkgdesc="This extension simplifies the use of the video recording function integrated in gnome shell, allows quickly to change the various settings of the desktop recording."
arch=('any')
url="https://github.com/EasyScreenCast/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-*-*}")
conflicts=("${provides}" "${provides}-git")
install=${provides}.install
source=('git+https://github.com/EasyScreenCast/EasyScreenCast.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  _extid="EasyScreenCast@iacopodeenosee.gmail.com"
  cd "${srcdir}/${_gitname}"
  make _build
  mv _build ${_extid}
  
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${provides}"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -af "${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
