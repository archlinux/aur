pkgname=esbuild-bin
pkgver=0.15.13
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-*}"
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

sha256sums_x86_64=('db6e52bd3829856dc3c735072a9ce058352a62f11a0df48fe403325ae8490f32')
sha256sums_i686=('e03823bc4a91ea568262a39f8620d70972ddbd347bd1191a3214ce1e0669c05a')
sha256sums_aarch64=('d337816da7f909ef37012262c9fc7be4680f827619b32bdac3a3606dd9248271')
sha256sums_armv7h=('a6e2790cbf8b9df47556a12a3bc62cd68e3edcacdbcc2151c34b5628871a7c54')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
