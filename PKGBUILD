_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.10
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${_name}.github.io"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")

_get_source() {
    local npmpkg="linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${_name}-${archive}::https://registry.npmjs.org/@${_name}/${npmpkg}/-/${archive}"
}

source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source ia32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('d82ca3469869e4c8dbed8ca0973767c6c716ed1c0e4d88e8d67b915c3fac496c')
sha256sums_i686=('519e15a646f79c31730f8ca919ed6263b5d5c27c68e291922e1d8b9b6c23b480')
sha256sums_aarch64=('c17197f659eea8ad64fca04212dc618627bf563924ee2f06b6b6ec37befd41ec')
sha256sums_armv7h=('e1aab9e81bf248f67744d2d068fa4ae60fc7d8d8063efec972ee52585e376c19')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
