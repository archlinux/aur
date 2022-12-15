_name=esbuild
pkgname=${_name}-bin
pkgver=0.16.7
pkgrel=2
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

sha256sums_x86_64=('1718e6f26d2632c5da0cc67d51e48aaa282489ba13f0b0f8ad27cea74513c4e3')
sha256sums_i686=('a0f64b749fc189693e8cfcf0105a08f460b285f011ca31d0949b2dcf170bc86b')
sha256sums_aarch64=('87ed8fb9a222638994126652fba3eafde3a75921ce1193fcad759876a958bb01')
sha256sums_armv7h=('cc25cfa2b76fcabc753bf23ea652f5d0a6b5242da2a4387ff90718f77d90a597')

package() {
    local bin="/usr/bin/${_name}"
    install -Dm755 "package/bin/${_name}" "${pkgdir}${bin}"

    local profile="/etc/profile.d"
    install -dm755 "${pkgdir}${profile}"
    echo "export ESBUILD_BINARY_PATH='${bin}'" > "${pkgdir}${profile}/${_name}.sh"
}
