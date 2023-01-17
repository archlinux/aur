_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.2
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

sha256sums_x86_64=('48ac6a17d60f95519e02c01ddd91340018cb43086f2e0037cef9aafd79b89c36')
sha256sums_i686=('315eae7ec0b9cd1aff9eece52e5752ed68ad452dc14bf637ed3a30417191eec9')
sha256sums_aarch64=('9f004e2957854125924192a25eb6319e99f883c8eafcea7034850f2a818792ef')
sha256sums_armv7h=('327a2935c2d8b69ead7eb72f328f6020cb9b6d13e89ff2e0d39a3e53226185c5')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
