# shellcheck disable=SC2148,SC2034,SC2154
# Maintainer: Alvin
pkgname=pvz-hybrid-bin
pkgver=0.20.0
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
sha256sums_x86_64=('21a32f86b1d244de6e6b2205ad07c5542caeecbbb4d65585f8dc40b038d2ef9b')

source_i686=("${_base_url}/pvz-hybrid_${pkgver}_i386.deb")
sha256sums_i686=('550a88cdc9e37e2f6627dccc604d78c6d37fb5f50c4787a867639dad6125825e')

source_aarch64=("${_base_url}/pvz-hybrid_${pkgver}_arm64.deb")
sha256sums_aarch64=('e7ae33f9b710c4cb3efa4fb7dafc6c02569c61d70e15940fd7b1b517138e9f20')

source_armv7h=("${_base_url}/pvz-hybrid_${pkgver}_armhf.deb")
sha256sums_armv7h=('a10d4242a4717b2298a77e9e1cad001f878d1d289d77e1c957d2370a94a4c60d')

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
