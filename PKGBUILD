# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxmirrors
pkgver=2026.10.21
pkgrel=1
pkgdesc="GNU/Linux mirror switching script - automatically detect and switch system package manager mirrors"
arch=('any')
url="https://github.com/SuperManito/LinuxMirrors"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SuperManito/LinuxMirrors/archive/76fbf1738c22108cdbcc73973612bdb07ad6789b.tar.gz")
sha256sums=('41b98b7eb6b983d665047b06c22f8b041c55f091cd7c106838b21cd33ef4e127')

package() {
    cd "${srcdir}/LinuxMirrors-76fbf1738c22108cdbcc73973612bdb07ad6789b"

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
