# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-system76-power-git
pkgver=47.0cc2661
pkgrel=3
pkgdesc="Gnome shell extension for System76 power management"
arch=('any')
url="https://github.com/pop-os/gnome-shell-extension-system76-power"
license=('MIT')
depends=('gnome-shell' 'system76-power')
makedepends=('git' 'make')
source=("${pkgname}::git+https://github.com/pop-os/gnome-shell-extension-system76-power.git"
		"update-metadata-json.patch")
sha256sums=('SKIP'
            '85e5a9c989ae170442f52531ffe0a6ccb5444118aca1919cb3d49e8250295de0')

pkgver() {
  cd ${pkgname}

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd ${pkgname}

  patch -Np1 -i ../update-metadata-json.patch
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install
}
