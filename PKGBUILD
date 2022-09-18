pkgname=esbuild-bin
pkgver=0.15.8
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${_name}")

_get_source() {
    local npmpkg="${_name}-linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${archive}::https://registry.npmjs.org/${npmpkg}/-/${archive}"
}

source_x86_64=("$(_get_source 64)")
source_i686=("$(_get_source 32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('67a8aec1c400503f57b039b5629313e1f7c4dcfe2e69799fcdb7661d07c0b602')
sha256sums_i686=('3c2d4daa2da4d5431080fff4815a99db840a1d9496902a376162cb9f44c98e0b')
sha256sums_aarch64=('31bfe2de3a422ac65936eaa58b9349e0405ff6000f42b5a473a34fc999628775')
sha256sums_armv7h=('1889080d394c4254b868b55b8883c336932bb445b8a06fc0bb3d0f31b84280c6')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
