# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386' 'armv6h')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_linux"
source_x86_64=("${_url}_amd64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_386.tar.gz")
source_armv6h=("${_url}_armv6.tar.gz")
sha256sums_x86_64=('ce2bef989b2aa4f42ad429f9883d6d9290c2db77582a92c37f4ff4741b86d210')
sha256sums_arm64=('212ee5ee4b366f38977492d8f34a1f4adcab52801fe1385ad0d36e49d01b42c2')
sha256sums_i386=('432cac2badbdfec0c98db91f19c21d242a8a4ce96b87eacd44753112be2e8d4e')
sha256sums_armv6h=('4288a89e97c27244f02957bdc4d692bdcd68b32143c044f5d3048994ebd4cb2a')

pkgver() {
  curl --silent -L "https://api.github.com/repos/raitonoberu/${_name}/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                                                 # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed 's/v//'
}

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
