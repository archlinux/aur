pkgname=esbuild-bin
pkgver=0.15.12
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

sha256sums_x86_64=('daeed357eec71bc707f9f375fa136c1f91d371bfdff04ea06fe779b960fccbb6')
sha256sums_i686=('603ac4b2cfcece1edc9585557af2f10884f35d64fcb2540947d22c68dd66ad20')
sha256sums_aarch64=('32004f9f008dbd099dfaf51eb861f9e0b1e9c4ca422d4466d1ca6e92b66c1cfd')
sha256sums_armv7h=('e5b04fcc48f432caba760d4d3991adc7e7ca96e5fad14b99827bdfc2378689de')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
