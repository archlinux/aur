# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-sachsen
pkgname="${_pkgname}"
epoch=0
pkgver=20230922.01
pkgrel=1
pkgdesc="Aerial (RGB and CIR) and topographic (DTK10, DTK25, DTK50, DTK100 and historic) maps provided by the German federal state of Saxony. WMS maps, if 'marble' crashes try 'marble-qt'."
url="https://www.landesvermessung.sachsen.de/geodaten-online-3962.html"
arch=('any')
license=(
  'custom: Public Domain'
  'custom: GeoSN'
)
groups=()
depends=(
  'marble-common'
)
makedepends=(
  'zstd'
)
optdepends=()
provides=()
conflicts=()
replaces=()
options=('emptydirs')
source=(
  'sachsen-topo-dtk-combined.dgml'
  'sachsen-luftbild-rgb.dgml'
  'sachsen-luftbild-rgb-raw.dgml'
  'sachsen-luftbild-ir.dgml'
  'sachsen-luftbild-historisch-1995-2000.dgml'
  'sachsen-topo-historisch-1922-1945.dgml'
  'sachsen-topo-historisch-1976-1989.dgml'
  'sachsen-topo-historisch-1990.dgml'

  'preview_topo-dtk10-50.png::https://www.landesvermessung.sachsen.de/img/geo-online/dtk-pc_280_rdax_260x260_87.png'
  'preview_aerial-rgb.jpg::https://www.landesvermessung.sachsen.de/img/geo-online/dop-rgb_280_rdax_260x260_87.jpg'
  'preview_aerial-rgb-raw.jpg::https://www.landesvermessung.sachsen.de/img/geo-online/dop-roh_280_rdax_260x260_87.jpg'
  'preview_aerial-cir.jpg::https://www.landesvermessung.sachsen.de/img/geo-online/dop-cir_280_rdax_260x260_87.jpg'
  'preview_aerial-historic-1995-2000.jpg::https://www.landesvermessung.sachsen.de/img/geo-online/dop-04_280_rdax_260x260_87.jpg'
  'preview_topo-historic.png::https://www.landesvermessung.sachsen.de/img/geo-online/mb_280_rdax_260x260_87.png'
  'base-tile-empty.jpeg'
  'base-tile-empty.png'
  'COPYING.txt'
)
sha256sums=(
  # .dgml:
  'b29b36200c292c2b0903495b09705926400186c92fbeb1a3c2d313a8de5e96e7'
  '93655ec0c31aeb7837c4f2fc63b0be050e518eb89392d5854788dca3f591df50'
  'bc94fc4504ce4d80ac093bc510a70b71b0f4c0e9ad7a06187f07221b5f6cd1fe'
  'dd06a3e0fc7cfb19659b487329b3699134af45fc754f1619b3bb0e0c38c4d4f6'
  '20698902aaa2fde4f0ad22cb1fe063ca3497f3845c3b29dae926ebd64fb82c24'
  'ca1d88d3d734a9b0e8964390369aba42e8a7a8ede24fbeb19e989abd296e5c3d'
  '9cc39bcca7f22f610693ae74c2465eba4405de50a2cb1348bca828502418a078'
  '87bedbf81955554b8deab1cc30991024483d0bf265384325bebda7fefb48971c'

  # preview:
  'ca6f24f100f15ac238e85329e69f1060c080ba142b4f0201cb0c22667c00a06c' # preview_topo-dtk10-50.png
  'b6d579732bec3e3b7aea34f7c45634f322afc40ae4e2b99c84308507ee3890dd'
  'fb7d7758d60c2b30b6a93f9fa2d6bc183525a7deabc4e17dc1f22b13e6b68bd7'
  'e372ee19a74ec328ee0f5d8be8d0a43c6609cdfaed9100d2d5b98aeafce3a761'
  '28393c87d3b41ff8da79a67d8bb89e8e0a573b50619912fc48fb8c2124f881ec'
  'b289f44259f1df9c5eeaa75a76951610b27b6a9eef588ebd37aa9dceaea59636' # preview_topo-historic.png

  # others:
  '340e165eb000011f97b63ecaf44569a0da9fea77b82331d384e5b4a54a86fb3b' # base-tile-empty.jpeg
  '9cdc25f88c3847e224535507a3d1aed35c4796dadb515cd52bf46c72b56f9369' # base-tile-empty.jpeg
  '19b09c83bd7436b7c48d2222af39d1e09609649f92055ff6f7c325b6a0fb3762' # COPYING.txt
)

package() {
  ## Install .dgml files and base tiles:
  for _dgml in "${srcdir}"/*.dgml; do
    _name="$(basename "${_dgml}" .dgml)"
    install -D -m644 -v "${_dgml}" "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/${_name}.dgml"
    install -D -m644 -v "${srcdir}/base-tile-empty.jpeg" "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/0/0/0.jpeg"
  done
  ## sachsen-topo-dtk-combined has a PNG and not a JPEG base tile -- fix up:
  rm -fv "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-topo-dtk-combined/0/0/0.jpeg"
  install -D -m644 -v "${srcdir}/base-tile-empty.jpeg" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-topo-dtk-combined/0/0/0.png"


  ## Install previews:
  install -D -m644 -v "${srcdir}/preview_topo-dtk10-50.png" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-topo-dtk-combined/preview.png"
  install -D -m644 -v "${srcdir}/preview_aerial-rgb.jpg" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-luftbild-rgb/preview.jpg"
  install -D -m644 -v "${srcdir}/preview_aerial-rgb-raw.jpg" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-luftbild-rgb-raw/preview.jpg"
  install -D -m644 -v "${srcdir}/preview_aerial-cir.jpg" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-luftbild-ir/preview.jpg"
  install -D -m644 -v "${srcdir}/preview_aerial-historic-1995-2000.jpg" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-luftbild-historisch-1995-2000/preview.jpg"
  for _historic in '1922-1945' '1976-1989' '1990'; do
    install -D -m644 -v "${srcdir}/preview_topo-historic.png" "${pkgdir}/usr/share/marble/data/maps/earth/sachsen-topo-historisch-${_historic}/preview.png"
  done

  ## Install copyright info:
  install -D -m644 -v "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
