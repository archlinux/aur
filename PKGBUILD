# Maintainer: chuanshanjia <1845776552@qq.com>

pkgname=linuxmirrors
pkgver=2026.09.08
pkgrel=1
pkgdesc="GNU/Linux mirror switching script - automatically detect and switch system package manager mirrors"
arch=('any')
url="https://github.com/SuperManito/LinuxMirrors"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SuperManito/LinuxMirrors/archive/61981d7f646f9368d5734926a0ce2069cb7f63c0.tar.gz")
sha256sums=('472c35c2acabd781286708724ecf18f59b7771352907883514d02510f657c351')

package() {
    cd "${srcdir}/LinuxMirrors-61981d7f646f9368d5734926a0ce2069cb7f63c0"

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
