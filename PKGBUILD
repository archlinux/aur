# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('fluent-icon-theme-git' 'fluent-round-icon-theme-git' 'fluent-cursor-theme-git')
pkgbase=fluent-icon-theme-git
pkgver=2023.06.07.r12.g4c0486a
pkgrel=1
pkgdesc="A Fluent design icon theme"
arch=('any')
url="https://github.com/vinceliuice/Fluent-icon-theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/vinceliuice/Fluent-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Fluent-icon-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Fluent-icon-theme

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package_fluent-icon-theme-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Fluent-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}

package_fluent-round-icon-theme-git() {
  pkgdesc+=" (round version)"
  provides=("${pkgname%-git}" 'fluent-icon-theme')
  conflicts=("${pkgname%-git}" 'fluent-icon-theme')

  cd Fluent-icon-theme
  ./install.sh -a -d "$pkgdir/usr/share/icons" -r
}

package_fluent-cursor-theme-git() {
  pkgdesc="An x-cursor theme inspired by Qogir theme and based on capitaine-cursors."
  url="https://www.pling.com/p/1499852"
  depends=('libxcursor')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Fluent-icon-theme/cursors
  install -d "$pkgdir/usr/share/icons"
  cp -r dist "$pkgdir/usr/share/icons/Fluent-cursors"
  cp -r dist-dark "$pkgdir/usr/share/icons/Fluent-dark-cursors"
}
