# Maintainer: MarkZZ <mark.weiman at markzz dot com>

pkgname=steam-session-kdm-git
pkgver=66
pkgrel=1
pkgdesc="Launch Steam Big Picture from your login screen - with KDM!"
arch=('any')
url="https://github.com/markzz/steam-session-arch-kdm"
license=('GPL2')
depends=('xfwm4' 'wmctrl' 'steam' 'zenity' 'kdebase-workspace')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "steam-session" "steam-session-git")
source=("${pkgname%-*}::git+https://github.com/markzz/steam-login-arch-kdm.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname%-*}

  git rev-list --count HEAD
}

package() {
  cd "${srcdir}"/${pkgname%-*}

  cp -dr --no-preserve=ownership steam-login/usr "${pkgdir}"/

# Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}"/usr/bin/steam-de
}

# vim: ts=2 sw=2 et:
