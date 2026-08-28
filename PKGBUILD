# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxmirrors
pkgver=2026.08.28
pkgrel=1
pkgdesc="GNU/Linux mirror switching script - automatically detect and switch system package manager mirrors"
arch=('any')
url="https://github.com/SuperManito/LinuxMirrors"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SuperManito/LinuxMirrors/archive/cfc27a08aee85e7a72174aba89b22b4c0b05896d.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/LinuxMirrors-cfc27a08aee85e7a72174aba89b22b4c0b05896d"

    # Install main script
    install -Dm755 ChangeMirrors.sh "${pkgdir}/usr/share/linuxmirrors/ChangeMirrors.sh"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create wrapper script in /usr/bin/
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/change-mirrors" <<'WRAPPER'
#!/bin/bash
exec /usr/share/linuxmirrors/ChangeMirrors.sh "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/change-mirrors"
}
