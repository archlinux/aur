_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.12
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

sha256sums_x86_64=('bc56c71378b046377af3110c363152596062c7173843aec0b2479ac89e016a1d')
sha256sums_i686=('50350f4e9bc41b9574129eb9922ec09f1592acbec445176c58bc8ebe2836c83f')
sha256sums_aarch64=('87a47aa45dfe333c73e5739b434b210875f3adf7dd1d1fa363f505c725afc01c')
sha256sums_armv7h=('bab7d5967a45c73ca9b344c55d613d1e7c1d8e8ec061610f5bbc396a903ac973')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
