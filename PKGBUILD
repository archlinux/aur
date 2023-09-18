# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Author: Himprakash Deka <himprakashd at gmail dot com>

pkgname=utterly-nord-plasma
pkgver=2.1
pkgrel=2
pkgdesc='A Global theme for Plasma 5 with transparency, blur, rounded edges for
window borders and widgets, Nord Color Palette and inspired wallpaper and a
reasonable desktop layout with a top panel, dock and a Android 12 like clock
widget.'
url='https://github.com/HimDek/Utterly-Nord-Plasma'
_commit='6d9ffe008f0bee47c8346c9a7ec71f206d999fd0'
arch=('any')
license=('GPL2')
depends=('plasma-desktop')
makedepends=('git')
optdepends=('kvantum: kvantum application style',
            'konsole: konsole color scheme'
            'sddm: sddm login theme'
            'utterly-round-plasma-style: complementing kwin style')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')
_theme_base='Utterly-Nord'

_package_and_rename() {
  local _src="$1"
  local _dst="$2"
  mkdir -p "${_dst}"
  cd "${_src}"
  find -type f -exec \
    install -Dm 644 '{}' "${_dst}/{}" \;
}

package() {
  cd "${srcdir}/${pkgname}"

  # colors
  mkdir -p "${pkgdir}/usr/share/color-schemes/"
  install -Dm 644 *.colors "${pkgdir}/usr/share/color-schemes/"

  # Konsole
  mkdir -p "${pkgdir}/usr/share/konsole/"
  install -Dm 644 *.colorscheme "${pkgdir}/usr/share/konsole/"

  # look-and-feel
  _package_and_rename \
    "${srcdir}/${pkgname}/look-and-feel" \
    "${pkgdir}/usr/share/plasma/look-and-feel/${_theme_base}"

  _package_and_rename \
    "${srcdir}/${pkgname}/look-and-feel-solid" \
    "${pkgdir}/usr/share/plasma/look-and-feel/${_theme_base}-Solid"

  _package_and_rename \
    "${srcdir}/${pkgname}/look-and-feel-light" \
    "${pkgdir}/usr/share/plasma/look-and-feel/${_theme_base}-Light"

  _package_and_rename \
    "${srcdir}/${pkgname}/look-and-feel-light-solid" \
    "${pkgdir}/usr/share/plasma/look-and-feel/${_theme_base}-Light-Solid"

  # wallpaper
  _package_and_rename \
    "${srcdir}/${pkgname}/wallpaper" \
    "${pkgdir}/usr/share/wallpapers/${_theme_base}"

  # kvantum
  _package_and_rename \
    "${srcdir}/${pkgname}/kvantum" \
    "${pkgdir}/usr/share/Kvantum/${_theme_base}"

  _package_and_rename \
    "${srcdir}/${pkgname}/kvantum-solid" \
    "${pkgdir}/usr/share/Kvantum/${_theme_base}-Solid"

  _package_and_rename \
    "${srcdir}/${pkgname}/kvantum-light" \
    "${pkgdir}/usr/share/Kvantum/${_theme_base}-Light"

  _package_and_rename \
    "${srcdir}/${pkgname}/kvantum-light-solid" \
    "${pkgdir}/usr/share/Kvantum/${_theme_base}-Light-Solid"

  # sddm
  _package_and_rename \
    "${srcdir}/${pkgname}/sddm" \
    "${pkgdir}/usr/share/sddm/themes/${_theme_base}"

}

# vim:set et ts=2 sw=2 tw=79:
