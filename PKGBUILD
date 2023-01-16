_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.1
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

sha256sums_x86_64=('bbebecaf8889456f57346e774c1181abbfda9e65988f45b802ad0eb972621193')
sha256sums_i686=('b6c48f98e5fbb2b9093ac141fc1353c4009065e7a8a8c314b581b8a9124cf92c')
sha256sums_aarch64=('1bcbe3657e6b3e2c28ef44d88fbd044ccdf054442c8b80caf038313cc840b971')
sha256sums_armv7h=('f17a9493d67704452ddf1b4ac0f77d2134bcd67f6e0306b3d80f3804b9472820')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
