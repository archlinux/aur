# Maintainer: eNV25 <env252525@gmail.com>

pkgname=xbps-static-bin
_pkgname=xbps
pkgver=0.59.2_1
pkgrel=1
pkgdesc='The X Binary Package System (XBPS) -- Static Binaries'
url="https://github.com/void-linux/xbps"
license=('custom: BSD-2-Clause' 'custom: BSD')
provides=('xbps-static' 'xbps')
conflicts=('xbps-static' 'xbps' 'xbps-git')

declare -A _arches=(
	['x86_64']='x86_64'
	['armv6h']='armv6l'
	['armv7h']='armv7l'
	['aarch64']='aarch64'
)

arch=("${!_arches[@]}")

_mirror='https://repo-fastly.voidlinux.org'

noextract=()
for _arch in "${!_arches[@]}"; do
	eval "source_$_arch=('$_mirror/static/xbps-static-static-$pkgver.${_arches["$_arch"]}-musl.tar.xz')"
	eval "noextract+=('xbps-static-static-$pkgver.${_arches["$_arch"]}-musl.tar.xz')"
done

package() {
	bsdtar -xf xbps-static-static-"$pkgver".*.tar.xz -C "$pkgdir/"
}

sha256sums_aarch64=('e45813ed61caab9143c4fdfafa584b3724da21a04cefb2c4f7aac5bae6bc76b8')
sha256sums_armv6h=('2032e0d2b74c151ccb266304519561b57cc54f2807b5b15e1c86b3cba10857a3')
sha256sums_x86_64=('7b861229717f0cadea1af049fa123d252d44b92e4534c0f1b6d1c16e3a103056')
sha256sums_armv7h=('f4706d2855adba82033b5dd8d4d51eef907f6243a2f19c68682b5112eff5a030')
