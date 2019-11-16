# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('arc-icon-theme-full-git')
pkgver=r145.ae267dc
pkgrel=2
pkgdesc="The complete Arc icon theme"
arch=('any')
url="https://github.com/rtlewis88/rtl88-Themes/tree/Arc-ICONS"
license=('GPL3')
makedepends=('git')
optdepends=('arc-gtk-theme' 'arc-solid-gtk-theme')
provides=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
conflicts=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
options=('!strip')

pkgver() {
  cd "$srcdir/rtl88-Themes/Arc-ICONS"
	( 
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
  git clone --single-branch --branch "Arc-ICONS" "$url"
  cd "$srcdir/rtl88-Themes/Arc-ICONS"
}

package() {
  install -dm 755 "$pkgdir/usr/share/icons/Arc-ICONS"
  cp -r "$srcdir/rtl88-Themes/Arc-ICONS/*" "$pkgdir/usr/share/icons/Arc-ICONS/"
}
# vim:set ts=2 sw=2 et:
