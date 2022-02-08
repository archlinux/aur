# Maintainer: dreieck

_pkgname=marble-maps-mapycz
pkgname="${_pkgname}"
epoch=0
pkgver=20220207.01
pkgrel=3
pkgdesc="Maps for KDE marble by mapy.cz (Czech Republic & Slovakia (OSM-based with own additions), and Worldwide (OSM based))."
url="http://mapy.cz/"
arch=('any')
license=(
  'custom: Public Domain'
  'custom: OSM/ mapy.cz'
)
groups=()
depends=(
  'marble-common'
)
makedepends=(
  'imagemagick'
  'zstd'
)
optdepends=()
provides=()
conflicts=()
replaces=()
options=('emptydirs')
source=(
  'mapycz-18xx.dgml'
  'mapycz-base.dgml'
  'mapycz-geo.dgml'
  'mapycz-places.dgml'
  'mapycz-tactile.dgml'
  'mapycz-tourist.dgml'
  'mapycz-traffic.dgml'
  'mapycz-winter.dgml'

  'mapycz-18xx-basetile.png::http://mapserver.mapy.cz/army2-m/0-0-0'
  'mapycz-base-basetile.png::http://mapserver.mapy.cz/base-m/0-0-0'
  'mapycz-geo-basetile.png::http://mapserver.mapy.cz/zemepis-m/0-0-0'
  'mapycz-places-basetile.png::http://mapserver.mapy.cz/base-m-traf-up/0-0-0'
  'mapycz-tactile-basetile.png::http://mapserver.mapy.cz/haptic-m/0-0-0'
  'mapycz-tourist-basetile.png::http://mapserver.mapy.cz/turist-m/0-0-0'
  'mapycz-traffic-basetile.png::http://mapserver.mapy.cz/base-m-traf-down/0-0-0'
  'mapycz-winter-basetile.png::http://mapserver.mapy.cz/winter-m/0-0-0'

  'mapycz-18xx-preview.jpeg::https://mapserver.mapy.cz/army2-m/14-8906-5633'
  'mapycz-base-preview.png::https://mapserver.mapy.cz/base-m/14-8884-5503'
  'mapycz-geo-preview.png::https://mapserver.mapy.cz/zemepis-m/14-8884-5503'
  'mapycz-places-preview.png::https://mapserver.mapy.cz/base-m-traf-up/14-8885-5503'
  'mapycz-tactile-preview.png::https://m4-mapserver.mapy.cz/haptic-m/14-8847-5544'
  'mapycz-tourist-preview.png::https://mapserver.mapy.cz/turist-m/14-8883-5501'
  'mapycz-traffic-preview.png::https://mapserver.mapy.cz/base-m-traf-down/14-8885-5503'
  'mapycz-winter-preview.png::https://mapserver.mapy.cz/winter-m-down/14-8887-5502'

  'COPYING.txt'
)
sha256sums=('ad8b0f2a6e0cb499ea439390ff9547c37065abddacf26108b69ff2ed430fcb83'
            '8893feaa65610c87266a2c8da491092084940e8704e6d94047eda93a954a97f8'
            '8b8a35d10b185441f66aaea381f70e47775d31a2bfb70bc7687b26d209839c75'
            '62ce417c66ebcc010284740c76668006a8445d47b48d8db50a154f67c7bba095'
            'e591131a6cb4de12e2061513e205d414b00c8c1ba903c0810da25606ffeb6ce2'
            'c3643c49ee39de1f9c9bc19f74878ddd246e723dfa26085ad4d0f50db3d79a28'
            '6dbe222d9b4b041ce99d65cef7162744b66a1789c1fe155621c8c8521ff79e6f'
            '8742e176961730130022da29b5453f60ee6f6dfabacdea8c3c8e471c517f2bb1'
            '57610c8c198f745b6631fe6d6b2e1f097e5a8e5db22822a2eb556d9f00b4a5a9'
            '741597c0fc488b38fecaa3dea773de5ad1ca4004a782fe8448ecaeb0bb5edbcd'
            '555c5a8cb839bb667e85f1d6bb9c885f8f2435eccb34ceb412a32a69836a87ab'
            '138001e24373e02ca0d06c8c1794da0de3d8da506e8757ca82c70ff233967fa8'
            '741597c0fc488b38fecaa3dea773de5ad1ca4004a782fe8448ecaeb0bb5edbcd'
            '741597c0fc488b38fecaa3dea773de5ad1ca4004a782fe8448ecaeb0bb5edbcd'
            '741597c0fc488b38fecaa3dea773de5ad1ca4004a782fe8448ecaeb0bb5edbcd'
            'c0b36741a98fe32f9d1489375dc8b19e7b6b151e8f0d39e74bb4218debeb8d74'
            '7d6a0452e5c22d9fdfc91e0a90add78b1047e34dadec777d4c0f4b47462ba863'
            '6e3b35f26f2674c9d79fd5e853677d4f23842fb9391ee12338fd44103d0b53bf'
            'fe4d64cfcb5296bc4f9249eb4ddf1a868c60ad94919351ff714875a620e37c9b'
            'a7ce81e85a51e0ff65ce2ccefff5e54ee509d284ffadfae19571c3a258b3d3e1'
            '741597c0fc488b38fecaa3dea773de5ad1ca4004a782fe8448ecaeb0bb5edbcd'
            'fa542f23982d9dd28cae3c41597e263727d6e0b86f2a2996f4340d4b3087dc3e'
            '2ae2ea031173704ea8537e8fe538371035e875abad6621f31cea2e20687a119b'
            '918e79ccb5bf9c2d84c0fd37573cc9320dddfb11c30753325f1620e8d126867f'
            'a61e1170e1825cca85fb9a3bc21d00347e636e155f6def34761f8f434a962e78')


build() {
  cd "${srcdir}"
  convert 'mapycz-18xx-basetile.png' -quality 45 -compress jpeg 'mapycz-18xx-basetile.jpeg'
}

package() {
  cd "${srcdir}"

  for _dgml in *.dgml; do
    _name="$(basename "${_dgml}" .dgml)"
    install -D -m644 -v "${_dgml}" "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/${_dgml}"
    case "${_name}" in
      "mapycz-18xx")
        install -D -m644 -v "${_name}-basetile.jpeg" "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/0/0/0.jpeg"
        install -D -m644 -v "${_name}-preview.jpeg"  "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/${_name}-preview.jpeg"
      ;;
      *)
        install -D -m644 -v "${_name}-basetile.png" "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/0/0/0.png"
        install -D -m644 -v "${_name}-preview.png"   "${pkgdir}/usr/share/marble/data/maps/earth/${_name}/${_name}-preview.png"
      ;;
    esac
  done

  install -D -m644 -v "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
