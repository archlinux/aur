# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=papirus-icon-theme-git
pkgver=20250201.r92.g8b32bb5
pkgrel=1
epoch=1
pkgdesc="Pixel perfect icon theme for Linux"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
license=('GPL-3.0-or-later')
depends=('gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
              'hardcode-tray-git: To fix hardcoded tray icons'
              'sif-git: To fix icons of running Steam games')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  install='alt-icons.install'

  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
