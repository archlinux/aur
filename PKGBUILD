# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

_pkgname='surface-control'
pkgname="${_pkgname}-bin"
pkgver=0.4.3
pkgrel=1
_pkgrel=1
pkgdesc='Control various aspects of Microsoft Surface devices from the Command-Line'
url='https://github.com/linux-surface/surface-control'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'systemd-libs')


provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "https://github.com/linux-surface/surface-control/releases/download/v${pkgver}-${_pkgrel}/surface-control-${pkgver}.${_pkgrel}-${CARCH}.bin.tar.xz"
)

sha256sums=('34cfc55d1697a75a8dc2fd8eb511eda9139a8b4f9e853042da6db590c71405d3')


package() {
    install -D -m755 "bin/surface" "$pkgdir/usr/bin/surface"

    # copy system files
    install -D -m644 "usr/lib/sysusers.d/surface-control.conf" "${pkgdir}/usr/lib/sysusers.d/surface-control.conf"
    install -D -m644 "usr/lib/udev/rules.d/40-surface-control.rules" "${pkgdir}/usr/lib/udev/rules.d/40-surface-control.rules"

    # completion files
    install -D -m644 "shell-completions/surface.bash" "$pkgdir/usr/share/bash-completion/completions/surface"
    install -D -m644 "shell-completions/surface.zsh"  "$pkgdir/usr/share/zsh/site-functions/_surface"
    install -D -m644 "shell-completions/surface.fish" "$pkgdir/usr/share/fish/completions/surface.fish"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}
