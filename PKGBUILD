#Maintainer: Erwin-Iosef erwiniosef@gmail.com
#PKGBUILD stolen from https://aur.archlinux.org/pkgbase/papirus-icon-theme-git(Thanks!)
#NOTE: First release.
pkgname=('papirus-icon-theme-plasma-fork-git' 'epapirus-icon-theme-plasma-fork-git')
pkgver=r7368.e55ae37
pkgrel=2
pkgdesc="Custom fork for Plasma to use Breeze colourable icons with the non-recolourable Papirus ones removed and added missing icons. Use at your own risk."
arch=('any')
url="https://github.com/Erwin-Iosef/papirus-icon-theme-plasma-fork.git"
license=("GPL-3.0-or-later")
depends=('gtk-update-icon-cache')
optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
            'hardcode-tray-git: To fix hardcoded tray icons'
            'sif-git: To fix icons of running Steam games')
makedepends=('git')
source=("git+https://github.com/Erwin-Iosef/papirus-icon-theme-plasma-fork.git")
options+=(!strip)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package_papirus-icon-theme-plasma-fork-git() {
  optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
              'hardcode-tray-git: To fix hardcoded tray icons'
              'sif-git: To fix icons of running Steam games')
  provides=('papirus-icon-theme')
  conflicts=('papirus-icon-theme')

  cd "${pkgbase%-git}"
  make DESTDIR="$pkgdir" ICON_THEMES="Papirus Papirus-Dark Papirus-Light" install
}

package_epapirus-icon-theme-plasma-fork-git() {
  pkgdesc+=" (for elementary OS and Pantheon Desktop only)"
  depends+=('papirus-icon-theme-plasma-fork-git')
  provides=('epapirus-icon-theme')
  conflicts=('epapirus-icon-theme')

  cd "${pkgbase%-git}"
  make DESTDIR="$pkgdir" ICON_THEMES="ePapirus ePapirus-Dark" install
}
