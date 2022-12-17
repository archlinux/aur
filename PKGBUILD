_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.8
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

sha256sums_x86_64=('c26a7b51513c049fe7c684033f7fd4e5b9f930a968594e9191f16849405ce0a7')
sha256sums_i686=('930f3c79aa106fcbdf0e642bf11ac56da8a527f84456cf87c4ee50a985f16787')
sha256sums_aarch64=('2b73faafe85dae218080eba16f9ea8fa31ed42b1cf0969d4b0fdf15bc3a3fcee')
sha256sums_armv7h=('8c3982ab97ff43640420cff1e3948d0add110e617485e02c00136991c8744cbc')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
