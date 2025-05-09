# Maintainer: ftk

_pkgname='mycoria'
pkgname="${_pkgname}-bin"
pkgver=0.5.5
pkgrel=1
pkgdesc="Open and secure overlay network that connects all participants"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mycoria/mycoria"
license=('BSD-3-Clause')
depends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/raw/refs/tags/v${pkgver}/packaging/mycoria.service")
source_x86_64=("mycoria::${url}/releases/download/v${pkgver}/mycoria_linux_amd64")
source_aarch64=("mycoria::${url}/releases/download/v${pkgver}/mycoria_linux_arm64")
source_armv7h=("mycoria::${url}/releases/download/v${pkgver}/mycoria_linux_armv7")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
backup=('opt/mycoria/config.yaml')
install=mycoria.install


pkgver() {
    {
    curl -Ssf "${url}/releases.atom" | grep '/releases/tag/' | sed -E 's@^.*/releases/tag/(.*)".*$@\1@; s@^v@@' | head -n 1 | grep '^[0-9][0-9\.]*$'
    } || echo "$pkgver"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"

    install -Dm755 "$srcdir/mycoria" "$pkgdir/opt/mycoria/mycoria"

    install -Dm644 "$srcdir/mycoria.service" "$pkgdir/usr/lib/systemd/system/mycoria.service"
}

