# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=ubuntu-backgrounds-trusty
pkgver=14.04.0.1
pkgrel=2
pkgdesc="The backgrounds included in Ubuntu 14.04 trusty"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="https://launchpad.net/ubuntu/+source/ubuntu-wallpapers/${pkgver}-0ubuntu1"
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ubuntu-wallpapers/${pkgver}-0ubuntu1/ubuntu-wallpapers_${pkgver}.orig.tar.gz")
sha256sums=('a66e322b5d081484cbade3e43103a1f05044dd418631dc68c33d81b6303a3990')

package() {

  # move only wallpapers which are new in trusty
  wallpapers=(
    "Backyard_Mushrooms_by_Kurt_Zitzelman.jpg"
    "Beach_by_Renato_Giordanelli.jpg"
    "Berries_by_Tom_Kijas.jpg"
    "Foggy_Forest_by_Jake_Stewart.jpg"
    "Forever_by_Shady_S.jpg"
    "Ibanez_Infinity_by_Jaco_Kok.jpg"
    "Jelly_Fish_by_RaDu_GaLaN.jpg"
    "Mono_Lake_by_Angela_Henderson.jpg"
    "Partitura_by_Vincijun.jpg"
    "Reflections_by_Trenton_Fox.jpg"
    "Sea_Fury_by_Ian_Worrall.jpg"
    "Water_web_by_Tom_Kijas.jpg"
  )

  for wallaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/trusty.xml#/usr/share/gnome-background-properties/trusty-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${pkgname}#g" \
    --expression "s#_name#name#g" \
    ${srcdir}/ubuntu-wallpapers-${pkgver}/trusty-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/trusty-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/trusty-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
