# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgbase=ubuntu-backgrounds
pkgname=(
  ubuntu-backgrounds-impish
  ubuntu-backgrounds-karmic
)
pkgver=0.1.0
pkgrel=1
pkgdesc="All backgrounds of Ubuntu"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"

_pkgver=22.04.4
source=("${url}/ubuntu-wallpapers_${_pkgver}.orig.tar.gz")
sha256sums=('83a9469e84c908d29f9fb2484029575a2d05548f9d984dca556740b622c5dd1e')

package_ubuntu-backgrounds-impish() {
  _pkgname=${pkgname/${pkgbase}-/}

  # encode to uft8
  mv ${srcdir}/ubuntu-wallpapers-${_pkgver}/Milky_Way_by_Paulo_José_Oliveira_Amaro.jpg ${srcdir}/ubuntu-wallpapers-${_pkgver}/Milky_Way_by_Paulo_Jose_Oliveira_Amaro.jpg
  mv ${srcdir}/ubuntu-wallpapers-${_pkgver}/Way_by_Kacper_Ślusarczyk.jpg ${srcdir}/ubuntu-wallpapers-${_pkgver}/Way_by_Kacper_Slusarczyk.jpg

  local wallpapers=(
    "Milky_Way_by_Paulo_Jose_Oliveira_Amaro.jpg"
    "Way_by_Kacper_Slusarczyk.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_ubuntu-backgrounds-karmic() {
  _pkgname=${pkgname/${pkgbase}-/}

  local wallpapers=(
    "Bay.jpg"
    "Butterfly.jpg"
    "Cherries.jpg"
    "Climbing.jpg"
    "FlordeLoto.jpg"
    "Frog.jpg"
    "GrassinA.jpg"
    "MistyMorning.jpg"
    "Naranja.jpg"
    "OLife.jpg"
    "Palmengarten.jpg"
    "PrimulaRed.jpg"
    "RadioactiveSunrise.jpg"
    "Sand.jpg"
    "Shoes.jpg"
    "Sunset.jpg"
    "TheRainbowisDead.jpg"
    "ThrowingStones.jpg"
    "WhiteOrchid.jpg"
  )

  package_wallpaper ${_pkgname} ${wallapers[@]}
}

package_wallpaper() {
  _pkgname=${1}
  wallpapers=${2}

  for wallaper in ${wallpapers[@]}; do
    echo "asd"
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${_pkgver}/${wallaper} ${pkgdir}/usr/share/backgrounds/${_pkgname}/${wallaper}
  done

  # edit xml
  # - replace directory, use a more detailed directory path
  # - fix xml tag
  sed \
    --in-place \
    --expression "s#/usr/share/backgrounds/contest/${_pkgname}.xml#/usr/share/gnome-background-properties/${_pkgname}-wallpapers.xml#" \
    --expression "s#/usr/share/backgrounds#/usr/share/backgrounds/${_pkgname}#g" \
    ${srcdir}/ubuntu-wallpapers-${_pkgver}/${_pkgname}-wallpapers.xml.in

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${_pkgver}/${_pkgname}-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/${_pkgname}-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${_pkgver}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}