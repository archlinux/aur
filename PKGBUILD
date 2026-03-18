# Maintainer: Jeff Hagadorn <noreply@github.com>
pkgname=z13ctl-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='CLI and daemon for ASUS ROG Flow Z13 hardware control'
arch=('x86_64')
url='https://github.com/dahui/z13ctl'
license=('Apache-2.0')
provides=('z13ctl')
conflicts=('z13ctl')
depends=('glibc')
optdepends=('ryzen_smu-dkms-git: CPU undervolting via Curve Optimizer')
install=z13ctl-bin.install
source=("https://github.com/dahui/z13ctl/releases/download/v${pkgver}/z13ctl_${pkgver}_linux_amd64.tar.gz")
sha256sums=('90cc7f5e80d9f23015a1fb7a49e6bdc539d0641cb74c6ec73ce5fdc9308a41ea')

package() {
    # Fix hardcoded path from v1.0.0 tarball (no-op for future releases)
    sed -i 's|ExecStart=.*/z13ctl |ExecStart=z13ctl |' "contrib/systemd/user/z13ctl.service"

    install -Dm755 "z13ctl"                                         "${pkgdir}/usr/bin/z13ctl"
    install -Dm644 "LICENSE"                                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/systemd/user/z13ctl.socket"            "${pkgdir}/usr/lib/systemd/user/z13ctl.socket"
    install -Dm644 "contrib/systemd/user/z13ctl.service"           "${pkgdir}/usr/lib/systemd/user/z13ctl.service"
    install -Dm644 "contrib/systemd/system/z13ctl-perms.service"   "${pkgdir}/usr/lib/systemd/system/z13ctl-perms.service"
}
