pkgname=esbuild-bin
pkgver=0.15.9
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

sha256sums_x86_64=('3aa4583f20c247fd9360c8bfab8f8260751b66228719cfc0a4b854bd83add0ce')
sha256sums_i686=('7b931c38379ae58436b51aee74e011b382ae36f8034309e531bc7aa79fd26163')
sha256sums_aarch64=('c83222618972f63e7e052d78c35ffc84ae364d1f98176165818693f5d039e591')
sha256sums_armv7h=('74b26b471ec464130ae91547b0701d647bf5f6ef8651276810c94d2c5fafc260')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
