# Maintainer: cscs <cscs at disroot dot org>
# Credit: Mark Wagie <mark dot wagie at proton dot me>
# Credit: And all of original https://aur.archlinux.org/packages/papirus-icon-theme-git

pkgname=papirus-mace-icon-theme-git
pkgver=r35.b209e9f
pkgrel=1
pkgdesc="Pixel perfect icon theme for Linux - MACE edition"
arch=('any')
url="https://gitlab.com/macelinux/icons/papirus-mace-icon-theme"
license=('GPL-3.0-or-later')
depends=('gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
source=('git+https://gitlab.com/macelinux/icons/papirus-mace-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
