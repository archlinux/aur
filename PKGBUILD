pkgname=esbuild-bin
pkgver=0.15.10
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

sha256sums_x86_64=('b8eec10627d3789b312abd2295d52a9979d7d4addf132c328c69977605fb4293')
sha256sums_i686=('95add29cafb7f742e60473b61fe43c430611f1445b9b40a2b2753084480f64f1')
sha256sums_aarch64=('ea58f83ae0a0283dc479afc66a1380f63204105d1571a3b605b058672538bba0')
sha256sums_armv7h=('59574a7f3c808cb8d3ceea5eeb6ecc50fc733c063b09b87a475189e5b2657f2b')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
