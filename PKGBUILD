# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Tomáš Vyčítal <tom.vycital@gmail.com>
pkgname=vimix-icon-theme-git
pkgver=2025.02.10.r0.g7d9a6e9
pkgrel=1
pkgdesc="A Material Design icon theme based on Paper Icon Theme"
arch=('any')
url="https://github.com/vinceliuice/vimix-icon-theme"
license=('CC-BY-SA-4.0')
depends=(
  'gtk-update-icon-cache'
  'hicolor-icon-theme'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("git+https://github.com/vinceliuice/vimix-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   cd "${pkgname%-git}"

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
