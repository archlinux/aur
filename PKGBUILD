# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Patrice Peterson <runiq@archlinux.us>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=gog-bastion
# pkgver was once 2.0.0.1
epoch=2
pkgver='1.50436.29.08.2018.23317'
pkgrel=1
pkgdesc='An action role-playing game set in a lush imaginative world. (GOG version)'
url='https://www.gog.com/game/bastion'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
source=("local://bastion_${pkgver//./_}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('e8b35a29dbe0e941232eea3c63ad2ae75f3d605868dfab5acdae85254e73b79a'
            '79c2b1c4e8d00c3b0f9dfc2b700929b6dc85b332047533e418fd0eb5cd41465b'
            '306723d271f33e32d3e057b7b1c69bc0075223364c136898557b24e4ae035a1c')

# ABS automagically figures out how to extract this game file. If said magic
# starts failing in the future, see prepare() in gog-pyre.

package(){
  # game files
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rt "${pkgdir}/opt/${pkgname}" "${srcdir}/data/noarch/"*

  # launcher
  chmod 755 "${pkgdir}/opt/${pkgname}/start.sh"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
