#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname='hmcl-dev'
_pkgname='hmcl'
pkgver='3.8.0.306'
pkgrel='1'
pkgdesc='A Minecraft Launcher which is multi-functional, cross-platform and popular (development version)'
arch=('any')
url='https://github.com/huanghongxun/HMCL'
license=('GPL3')
provides=('hmcl')
conflicts=('hmcl')
depends=('jre21-openjdk')
makedepends=('jdk21-openjdk' 'gradle' 'git')
source=('hmcl-launch-script'
        "${_pkgname}.desktop"
        "git+https://github.com/huanghongxun/HMCL.git#tag=v${pkgver}")
sha256sums=('5052316e95f26a137cd7ab3953e7b019bcd0a755cfe27abb318c505eb6268baf'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            '59a2eca1f617e65baf198f5b6bab32c77ded87a39be1d0308c4115fe62c4ebd3')

build ()
{
  cd HMCL || exit
  gradle --no-daemon build
}

package ()
{
  # custom launch script
  install -Dm755 'hmcl-launch-script' "${pkgdir}/usr/bin/${_pkgname}"
  # desktop file
  install -Dm644 'hmcl.desktop' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # install jar
  _path=$(echo HMCL/HMCL/build/libs/HMCL*.jar)
  install -Dm644 "${_path}" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  # install icon
  install -Dm644 'HMCL/HMCL/image/craft_table.webp' "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
}
