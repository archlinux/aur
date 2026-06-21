# Maintainer: Paulo Manrique <4464977+paulomanrique@users.noreply.github.com>

pkgname=latency-map-bin
pkgver=0.0.6
pkgrel=1
pkgdesc='Desktop latency benchmarking app with Electron and native system network tools'
arch=('x86_64' 'aarch64')
url='https://github.com/paulomanrique/latency-map'
license=('Unlicense')
depends=('fuse2' 'traceroute')
optdepends=('iputils: tracepath fallback on Linux')
provides=('latency-map')
conflicts=('latency-map' 'latency-map-git')
options=('!strip')
source=(
  'latency-map.png'
  'latency-map.desktop'
  'latency-map.sh'
)
source_x86_64=("LatencyMap-${pkgver}-linux-x86_64.AppImage::${url}/releases/download/v${pkgver}/LatencyMap-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("LatencyMap-${pkgver}-linux-arm64.AppImage::${url}/releases/download/v${pkgver}/LatencyMap-${pkgver}-linux-arm64.AppImage")
sha256sums=(
  '94ac4fd79a20265b5448b4d745edf09cea3bc34e80aee90a407a60176cb8aaad'
  '52267164dcca52da84ad8944dccdb808de2e8c263047e4b43eb2204bf29eb123'
  'e1ad15fcbe663a3062441059d2c4eb7b29e7094c063e6b0ba30b6f00ec1a7a68'
)
sha256sums_x86_64=('96c4833f05f9917d83f209a8f89cd456b9b5fd9ac054d0a794f608e9c0cffc76')
sha256sums_aarch64=('8aab9d4af09b99f319e87d8cc24a0a1927b8bc454ba020e2337ddeee6f1c3261')

package() {
  local appimage_arch

  case "${CARCH}" in
    x86_64)
      appimage_arch='x86_64'
      ;;
    aarch64)
      appimage_arch='arm64'
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm755 "${srcdir}/LatencyMap-${pkgver}-linux-${appimage_arch}.AppImage" "${pkgdir}/opt/latency-map/latency-map.AppImage"
  install -Dm755 "${srcdir}/latency-map.sh" "${pkgdir}/usr/bin/latency-map"
  install -Dm644 "${srcdir}/latency-map.desktop" "${pkgdir}/usr/share/applications/latency-map.desktop"
  install -Dm644 "${srcdir}/latency-map.png" "${pkgdir}/usr/share/pixmaps/latency-map.png"
}
