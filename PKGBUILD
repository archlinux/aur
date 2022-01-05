# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('fluent-icon-theme-git' 'fluent-round-icon-theme-git' 'fluent-cursor-theme-git')
pkgbase=fluent-icon-theme-git
pkgver=2021.12.20.r1.g7004850
pkgrel=2
arch=('any')
license=('GPL3')
makedepends=('git' 'gtk-update-icon-cache')
options=('!strip')
source=("${pkgbase%-git}::git+https://github.com/vinceliuice/Fluent-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgbase%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_fluent-icon-theme-git() {
  pkgdesc="A Fluent design icon theme"
  url="https://www.pling.com/p/1477945"
  depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/${pkgbase%-git}"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}

package_fluent-round-icon-theme-git() {
  pkgdesc="A Fluent design icon theme (round version)"
  url="https://www.pling.com/p/1477945"
  depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
  provides=("${pkgname%-git}" 'fluent-icon-theme')
  conflicts=("${pkgname%-git}" 'fluent-icon-theme')

  cd "$srcdir/${pkgbase%-git}"
  ./install.sh -a -d "$pkgdir/usr/share/icons" -r
}

package_fluent-cursor-theme-git() {
  pkgdesc="An x-cursor theme inspired by Qogir theme and based on capitaine-cursors."
  url="https://www.pling.com/p/1499852"
  depends=('libxcursor')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/${pkgbase%-git}/cursors"
  install -d "$pkgdir/usr/share/icons"
  cp -r dist "$pkgdir/usr/share/icons/Fluent-cursors"
  cp -r dist-dark "$pkgdir/usr/share/icons/Fluent-dark-cursors"
}
