# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.3.0
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
sha256sums_x86_64=('03a27f2c7e67bec39cd24f8c5b9f164e153b19ba6b1056dbe51e2d1555842e80')
sha256sums_arm64=('fdd940751e5ae057826ab0dcd9fe7979109387aed6fa6e0f5f8a69de589c92f5')
sha256sums_i386=('52bd0bc656e6b02c7f291ee64f1d0a56bb5d6063465f4be986c74937f686fdfb')
sha256sums_armv6h=('ec262e6274478e1ba97b45277df3312a8e6461b12ddb19499e9c948200e19750')

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
