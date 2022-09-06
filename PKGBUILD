pkgname=esbuild-bin
pkgver=0.15.7
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

sha256sums_x86_64=('6d9f01aad7f65eb8de693c771b0755a7383e38dec285e38e8e03ce21badbe652')
sha256sums_i686=('16cf0a52df62bd10af9f09c4db9092c415e37a0850beaaa347cc0ee40099c10e')
sha256sums_aarch64=('fc8e46a7908e826fc3857a3dbb8556938f4a1d12ed79b3233c7cefadbd22e812')
sha256sums_armv7h=('e039d252d189f909088e1300462358145d8dc1f5763f63530257faffd66dae1c')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
