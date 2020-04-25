# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=plasma5-applet-tiledmenu
pkgname=plasma5-applet-tiledmenu-git
pkgver=v33.r0.gfdc793f
pkgrel=1
pkgdesc="A menu based on Windows 10's Start Menu."
url='https://store.kde.org/p/1160672'
license=('GPL')
arch=('any')
makedepends=('git')
depends=('plasma-workspace' 'qt5-graphicaleffects')
provides=('plasma5-applets-tiledmenu')
conflicts=('plasma5-applets-tiledmenu')
source=("${_pkgname}::git://github.com/Zren/plasma-applet-tiledmenu.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"

  local dest="${pkgdir}/usr/share/plasma/plasmoids/org.kde.plasma.tiledmenu"

  install -dm0755 ${dest}
  cp -r package/* ${dest}

  # In /usr/share/plasma/plasmoid, KDE Plasma recognize applets named "org.kde.*" only.
  sed -i 's|com.github.zren.tiledmenu|org.kde.plasma.tiledmenu|g' "${dest}"/metadata.desktop
}
