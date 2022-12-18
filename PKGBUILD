_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.9
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

sha256sums_x86_64=('bb39ca6e7446768f1b4432a4556dcbfddbd8926fca3013f784bb8700e1527ec7')
sha256sums_i686=('5274a5fad039f1d16b86a92159d9e46e1c7bf543f3ca97acc13d244e2f7512e3')
sha256sums_aarch64=('fe41c3ee6aea129642bb5893171451c446aacc69164e6a0895f399a5c57ffd48')
sha256sums_armv7h=('081c0a2a3e77714295df28f4c645cb3ffb8876f9a4fe99eaa2a1b058f9e59111')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
