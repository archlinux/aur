# Maintainer: Vinícius de Ávila Jorge <vinicius.avila.jorge@gmail.com>

pkgname=ubuntu-backgrounds-questing
pkgver=25.10.2
pkgrel=1
pkgdesc="The backgrounds included in Ubuntu 25.10 questing"
license=('Commons Attribution-ShareAlike 3.0 Unported')
arch=('any')
url="http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers"
source=(
  "${url}/ubuntu-wallpapers_${pkgver}.orig.tar.gz"
  "quokka.patch"
)
sha256sums=(
  '63e28929087636f021162fd33827c109c79182969c7a0dca4a14c36014b93c1b'
  '8727233f156e6cc467e08ba3a2ae75b7b585ea7130ac5c5716be5ad65d4652ea'
)

prepare() {
  echo `pwd`
  patch -Np1 ubuntu-wallpapers-${pkgver}/questing-wallpapers.xml.in ../quokka.patch
}

package() {
  # move only wallpapers which are new in questing
  wallpapers=(
    "Flash_and_Thunder_by_Julian_Tomasini.jpg"
    "Lonely_Quokka_by_Dilip.png"
    "Quokka_Everywhere_by_Dilip.png"
    "The_Web_by_nkhdiscovery.png"
    "Ubuntu_with_Frutiger_Metro_by_lyk_lyk.png"
    "Schattenzug_by_OrbiteLambda.webp"
    "Questing_Quokka_Full_Light_3840x2160.png"
    "Questing_Quokka_Full_Dimmed_3840x2160.png"
    "Questing_Quokka_Full_Dark_3840x2160.png"
    "Questing_Quokka_Wallpaper_Light_3840x2160.png"
    "Questing_Quokka_Wallpaper_Dimmed_3840x2160.png"
    "Questing_Quokka_Full_Color_3840x2160.png"
  )

  for wallpaper in ${wallpapers[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/${wallpaper} ${pkgdir}/usr/share/backgrounds/${pkgname}/${wallpaper}
  done

  # move xml
  property_dirs=(
    "cinnamon-background-properties"
    "gnome-background-properties"
    "mate-background-properties"
  )

  for property_dir in ${property_dirs[@]}; do
    install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/questing-wallpapers.xml.in ${pkgdir}/usr/share/${property_dir}/questing-wallpapers.xml
  done

  # license
  install -D --mode 644 ${srcdir}/ubuntu-wallpapers-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
