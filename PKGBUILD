_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.11
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

sha256sums_x86_64=('121716105b38d5eb59f2ab31d583d2b821754a59fbb66a6714849064dd2486f3')
sha256sums_i686=('d51ffcdedd8a85474d0868e0e85d2a7322ef2f5e6d2d82900042c4e89314e085')
sha256sums_aarch64=('cdb04a609fadf16d593ca96bb44fd3ecf2d5dc4fb197a6bf12526029f95664fe')
sha256sums_armv7h=('fe4560e71c602c22169d10dba90a54fd2434e9977d9428f3c02603427a06572d')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
