# Maintainer: Michal Donát <aur at donat dot cz>
pkgname=gnome-shell-extension-autohide-battery-git
_pkgname=autohide-battery
pkgver=r171.14a01ac
pkgrel=1
pkgdesc="GNOME Shell extension to hide battery icon, if battery is fully charged and AC is connected"
arch=('any')
url="https://github.com/ai/autohide-battery.git"
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'pnpm' 'unzip')
source=("git+https://github.com/ai/autohide-battery.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  pnpm run build
}

package() {
  targetdir="${pkgdir}/usr/share/gnome-shell/extensions/autohide-battery@sitnik.ru/"
  install -d "${targetdir}"
  unzip -d "${targetdir}" "${srcdir}/${_pkgname}/autohide-battery@sitnik.ru.shell-extension.zip" 
}
