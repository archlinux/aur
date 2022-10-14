pkgname=esbuild-bin
pkgver=0.15.11
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

sha256sums_x86_64=('39cbcd59fdc268073e554353dad4d6a69fd23d0f2d2d424c73c68ab8d0e52727')
sha256sums_i686=('596e35843f02221ef2a2f8ddad0640c61463c2af898048e2c4d6ea98e3a03806')
sha256sums_aarch64=('d5f488dc0875588418969fa05395cd55f5344aa501958d5a3a251fe49c2aee3f')
sha256sums_armv7h=('886114d87bd2cf11ef3c74f4010cd677f4e38d4a3b3d11bf8051f61053fe9f37')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
