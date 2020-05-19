# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=arc-icon-theme-full-git
pkgver=1.0.r110.g6073d02
pkgrel=1
pkgdesc='The complete Arc icon theme'
arch=('any')
url='https://github.com/rtlewis88/rtl88-Themes/tree/Arc-ICONS'
license=('GPL3')
makedepends=('git')
optdepends=('arc-gtk-theme' 'arc-solid-gtk-theme')
provides=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
conflicts=("${pkgname%-*}" "${pkgname}" "arc-icon-theme")
options=('!strip')

pkgver() {
  cd "${srcdir}/rtl88-Themes/Arc-ICONS"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  echo 'Downloading icons ...'
  if [[ -d rtl88-Themes ]]; then
    rm -rf rtl88-Themes
  fi
  git clone --single-branch --branch "Arc-ICONS" "https://github.com/rtlewis88/rtl88-Themes"
}

package() {
  install -dm755 "${pkgdir}/usr/share/icons/Arc-ICONS"
  cp -r "${srcdir}"/rtl88-Themes/Arc-ICONS/* "${pkgdir}/usr/share/icons/Arc-ICONS/"
}
# vim:set ts=2 sw=2 et: