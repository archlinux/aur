# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=('papirus-icon-theme-git' 'epapirus-icon-theme-git')
pkgbase=papirus-icon-theme-git
pkgver=20231201.r7.ga510018dad
pkgrel=1
epoch=1
pkgdesc="Pixel perfect icon theme for Linux"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_papirus-icon-theme-git() {
  optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
              'hardcode-tray-git: To fix hardcoded tray icons'
              'sif-git: To fix icons of running Steam games')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  install='alt-icons.install'

  cd "${pkgbase%-git}"
  make DESTDIR="$pkgdir" ICON_THEMES="Papirus Papirus-Dark Papirus-Light" install
}

package_epapirus-icon-theme-git() {
  pkgdesc+=" (for elementary OS and Pantheon Desktop only)"
  depends+=('papirus-icon-theme-git')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "${pkgbase%-git}"
  make DESTDIR="$pkgdir" ICON_THEMES="ePapirus ePapirus-Dark" install
}
