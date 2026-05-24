# shellcheck disable=SC2148,SC2034,SC2154
# Maintainer: Alvin
pkgname=pvz-hybrid-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="植物大战僵尸杂交版 (Linux Native) - Godot 原生移植版本"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
# 官网: https://www.pvzhe.com
# 项目: https://github.com/cublueer/pvz-hybrid
url="https://github.com/cublueer/pvz-hybrid"
license=('custom')
options=(!debug)
depends=('glibc')
install=pvz-hybrid-bin.install

_base_url="https://github.com/cublueer/pvz-hybrid/releases/download/v${pkgver}"

source_x86_64=("${_base_url}/pvz-hybrid_${pkgver}_amd64.deb")
sha256sums_x86_64=('44abb21b113df4f4f942286b2d7c04017e897300df592a259a14ec296ea4391e')

source_i686=("${_base_url}/pvz-hybrid_${pkgver}_i386.deb")
sha256sums_i686=('e5e1c27d6cb201f4cbfe20aaffe4890744a205f542ad4a7708c55925bd3347d3')

source_aarch64=("${_base_url}/pvz-hybrid_${pkgver}_arm64.deb")
sha256sums_aarch64=('5073a25d06b9eaaaf54f2681701bc78cb5e49a291036dbd5064f37a77a547ca2')

source_armv7h=("${_base_url}/pvz-hybrid_${pkgver}_armhf.deb")
sha256sums_armv7h=('74011097da0f55040662295faf6f1617e4ae75b9f962d22f8a44df199bbd21d1')

case "$CARCH" in
    x86_64)  _deb_arch="amd64" ;;
    i686)    _deb_arch="i386" ;;
    aarch64) _deb_arch="arm64" ;;
    armv7h)  _deb_arch="armhf" ;;
    *)       echo "Unsupported architecture: $CARCH"; exit 1 ;;
esac

package() {
    _deb="pvz-hybrid_${pkgver}_${_deb_arch}.deb"
    bsdtar -xf "$srcdir/${_deb}" -C "$srcdir" "data.tar.xz"
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
