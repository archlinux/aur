pkgname=esbuild-bin
pkgver=0.15.14
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

sha256sums_x86_64=('c445d0d59e3b92a4e381f98fb2ac0cd587e24d295234b45f16be324040e6a3e6')
sha256sums_i686=('036e6d0ed5df0f880e6030ce3da45c20ead8e7d2e1f4a7bee0a831b9e4f0408b')
sha256sums_aarch64=('ab9e763586af8a861eef4ea30305e176aa7466a21aff6138d39224601c1e0835')
sha256sums_armv7h=('287000299466e77df7303d5e36d34a6808152f0c707b7320c84c11bbb6653eb4')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
