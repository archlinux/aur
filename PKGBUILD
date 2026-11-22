# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxmirrors
pkgver=2026.11.19
pkgrel=2
pkgdesc="GNU/Linux mirror switching script - automatically detect and switch system package manager mirrors"
arch=('any')
url="https://github.com/SuperManito/LinuxMirrors"
license=('MIT')
depends=('bash')
_commit=7f8989fd237314722e64a23dc4e873f48bafbb9b
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SuperManito/LinuxMirrors/archive/${_commit}.tar.gz")
sha256sums=('597bf0604fef56f9faf0ec850abacb00ce64aad654b96100d11da122ef0ca11f')

package() {
    cd "${srcdir}/LinuxMirrors-${_commit}"

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
