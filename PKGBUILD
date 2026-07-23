# Maintainer: Guru <anjanaya@gmail.com>
pkgname=eugene-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Lint Postgres schema migrations for locks and downtime risks"
arch=('x86_64' 'aarch64')
url="https://github.com/kaaveland/eugene"
license=('MIT')
provides=('eugene')
conflicts=('eugene')
options=('!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kaaveland/eugene/${pkgver}/LICENSE.md")
source_x86_64=("eugene::https://github.com/kaaveland/eugene/releases/download/${pkgver}/eugene-x86_64-unknown-linux-musl")
source_aarch64=("eugene::https://github.com/kaaveland/eugene/releases/download/${pkgver}/eugene-aarch64-unknown-linux-musl")
sha256sums=('64fc54cd75c6d040f46718cc676982e16280fd65792208e92c13ef08a69eec2d')
sha256sums_x86_64=('444c4bb101a86e917b73779dbc9be8f50039c53c54dce4be3544d1b3d186d845')
sha256sums_aarch64=('97ce9c9838f636bed50b79385e1c5c8f22788d1fde31e25c9cddba959003c9bf')

package() {
    install -Dm755 "${srcdir}/eugene" "${pkgdir}/usr/bin/eugene"

    "${pkgdir}/usr/bin/eugene" completions -s bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/eugene"
    "${srcdir}/eugene" completions -s zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_eugene"
    "${srcdir}/eugene" completions -s fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/eugene.fish"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}