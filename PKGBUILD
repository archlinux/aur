_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.17
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

sha256sums_x86_64=('3bf393361d71e79152b95d0b192cb05641e4441b13ffb5f9b4e59b79d5aa11a2')
sha256sums_i686=('e586751a9669af3e5085006b6e8d5ea2b136b674fa2d312856780b60689ca872')
sha256sums_aarch64=('b4f0a9da36781601e9074a5d9345db3a9abd41518384a6ad79d59655fb851a04')
sha256sums_armv7h=('10d338d5a0a8066ff3bdc9e3d2749c845187ee9ccccb5e7cbf7f46e17e5fd9f2')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
