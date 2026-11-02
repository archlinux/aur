# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxmirrors
pkgver=2026.10.31
pkgrel=1
pkgdesc="GNU/Linux mirror switching script - automatically detect and switch system package manager mirrors"
arch=('any')
url="https://github.com/SuperManito/LinuxMirrors"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SuperManito/LinuxMirrors/archive/b52707f38e5800d48ac7cc3f390eafec9e948faf.tar.gz")
sha256sums=('3a24ba51232cada44ede55e7e0a9cf74a0b5e171f23cadce8e8d3078c68020f7')

package() {
    cd "${srcdir}/LinuxMirrors-b52707f38e5800d48ac7cc3f390eafec9e948faf"

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
