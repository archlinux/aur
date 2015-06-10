# Maintainer: MarkZZ <mark.weiman at markzz dot com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=steam-session-git
pkgver=61
pkgrel=1
pkgdesc="Launch Steam Big Picture from your login screen"
arch=('any')
url="https://github.com/thor27/steam-login/"
license=('GPL2')
depends=('xfwm4' 'wmctrl' 'steam' 'zenity')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "steam-session-kdm" "steam-session-kdm-git")
source=("${pkgname%-*}::git+https://github.com/thor27/steam-login.git")
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
