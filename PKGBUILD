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
sha256sums_x86_64=('97627e37e5fbe13683c0bb1d4064a6e61e3d6a4bf052aa66ca4973d97c2590ab')

source_i686=("${_base_url}/pvz-hybrid_${pkgver}_i386.deb")
sha256sums_i686=('1cd6226e77879b5414263393cff4fc4a6e33c63fb5e705375aa330068061d114')

source_aarch64=("${_base_url}/pvz-hybrid_${pkgver}_arm64.deb")
sha256sums_aarch64=('aedb2640eef2948376b12540a650b2e107e933f02ea1e25f22f32594665acaeb')

source_armv7h=("${_base_url}/pvz-hybrid_${pkgver}_armhf.deb")
sha256sums_armv7h=('f84ce1fa9c0bb0ba47c097e67b18304f5d72d52b1e88bf79b412430fd5e78238')

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
