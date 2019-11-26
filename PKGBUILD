# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-animation-tweaks-git
_pkgname=Animation-Tweaks
pkgver=8.482f1ab
pkgrel=1
pkgdesc="A GNOME Shell Extension to Tweak animations and customize them."
arch=('any')
url="https://github.com/Selenium-H/Animation-Tweaks"
license=('GLPv3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/Selenium-H/Animation-Tweaks.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(grep '^Version ' README.md | cut -d' ' -f2).$(git describe --always --tags)
}

package() {
  _extid='animation-tweaks@Selenium-H'
  cd "${srcdir}/${_pkgname}"
  
  cp -af schemas "${_extid}"
  cp -af locale "${_extid}"

  glib-compile-schemas "${_extid}/schemas"
  rm -rf "${_extid}/schemas/"*.xml

  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -af "${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
