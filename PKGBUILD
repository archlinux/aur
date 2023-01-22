_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.4
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

sha256sums_x86_64=('0765623e2e266abfa806d7c084d84a9dc8c8b3f7297306b45c4249e9a7c560c1')
sha256sums_i686=('5253ef327b7fbd9f7a3a80461a50f2e3c48b1714bda59a1e5f49a93e68eba80e')
sha256sums_aarch64=('cfdcbc8dd6e5262abf508f564f51b30e3a55c2969f0a6ec6a6889481b4c9e00d')
sha256sums_armv7h=('bba7ed90353a1f574edfa4766ea970818f7e51da14200e3c934f3c58d9c240e2')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
