_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.3
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

sha256sums_x86_64=('3c7aa42ce455e819475d16f34352f3008271a43aa80adad308df4e8f29413648')
sha256sums_i686=('a19da8b132c8022d943705acbfe9e8c7b8fa1f498e34dc637c7cfdfe9eb9af57')
sha256sums_aarch64=('93bbd22e0a18f4792498a98017b733d069e746e02ba0af0b6a28f77f8f8d3d6f')
sha256sums_armv7h=('d7e3d9ec54faa57f34181e84d005707e598083f81f636298dd46dcc7c73da764')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
