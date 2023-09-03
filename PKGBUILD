# Maintainer: eNV25 <env252525@gmail.com>

pkgname=xbps-static-bin
_pkgname=xbps
pkgver=0.59.1_6
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

_mirror='https://alpha.de.repo.voidlinux.org'

noextract=()
for _arch in "${!_arches[@]}"; do
	eval "source_$_arch=('$_mirror/static/xbps-static-static-$pkgver.${_arches["$_arch"]}-musl.tar.xz')"
	eval "noextract+=('xbps-static-static-$pkgver.${_arches["$_arch"]}-musl.tar.xz')"
done

package() {
	bsdtar -xf xbps-static-static-"$pkgver".*.tar.xz -C "$pkgdir/"
}

sha256sums_aarch64=('2561ef877ad90133d1be5511a60dbfdfc0cc4c4a3377cdef9b8b0253dc1e17dc')
sha256sums_armv6h=('02c381087963d8baa85311e321580eb578e45da05f1ca2aa1bd5afaf7962a448')
sha256sums_x86_64=('04b39e0566e81bdc03b4f47bc979749aa45990bc8e07c7179430a8af59fa109e')
sha256sums_armv7h=('ee291a02f8d835d6f51373266454cb76f43b15dd2d21b43fd83ca80385411e03')
