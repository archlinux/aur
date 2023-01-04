_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.14
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

sha256sums_x86_64=('2405e72478802c873c8336121366ea3596a40cd41ed60d41e5c4f0282e7669b3')
sha256sums_i686=('3e61c3f8c26a4a9b4c6bde0b311ee30a5123e46ea04474aa5a74fdbd434326fc')
sha256sums_aarch64=('2628cd8a2fc6fecfd8e70a0df17c89216983ee15a8e67f4dbdd6b90591b958f7')
sha256sums_armv7h=('5a525fdbd58f263ad2e38e1cddeda47f62b3628b5c924d766d6ce8b4db81e3c6')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
