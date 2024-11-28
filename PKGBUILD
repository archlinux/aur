# Maintainer: envolution
# Contributor: jmcb <joelsgp@protonmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=osm2world
pkgver=0.3.1
pkgrel=2
pkgdesc="Converter that creates three-dimensional models of the world from OpenStreetMap data."
arch=('any')
url="http://osm2world.org/"
license=('LGPL3')
depends=('java-runtime>=17')
source=(
  "https://osm2world.org/download/files/${pkgver}/OSM2World-${pkgver}-bin.zip"
  'osm2world.sh'
  "osm2world.desktop")
sha256sums=('7acbf32e09427b3777b8a4b56b830a8ba8b566ceb1a5c76da672b60231e99634'
            '8c3c527ba1d29613adae3cd1c2d8bfb2f919ce1b73cbc95c7c6dc459fd735399'
            '864aa575d101cac2348144ab64ae9702a3b0a1ed3e05c796536ae4545465ce2a')

package() {
  local destdir="${pkgdir}/opt/osm2world"

  install -dm755 "${destdir}"

  cp -r ""* "${destdir}/"

  find "${destdir}" -type d -exec chmod 755 {} +
  find "${destdir}" -type f -exec chmod 644 {} +

  if [[ -f "${destdir}/OSM2World.jar" ]]; then
    chmod 755 "${destdir}/OSM2World.jar"
  fi
  install -Dm755 osm2world.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:
