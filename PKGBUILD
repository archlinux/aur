# Maintainer: AndreLeclercq <andre.leclercq.io@protonmail.com>
pkgname=sshctl
pkgver=0.2.0
pkgrel=1
pkgdesc="SSH connection manager CLI tool (binary stable)"
arch=('x86_64')
url="https://github.com/AndreLeclercq/sshctl"
license=('MIT')
depends=('glibc')
makedepends=('git' 'rust')
provides=('sshctl')
conflicts=('sshctl')
source=("git+https://github.com/AndreLeclercq/sshctl.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/sshctl"
    cargo build --release
}

package() {
    cd "${srcdir}/sshctl"
    install -Dm755 "target/release/sshctl" "${pkgdir}/usr/bin/sshctl"
    
    # Documentation
    if [ -f README.md ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/sshctl/README.md"
    fi
    
    # License
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sshctl/LICENSE"
    fi
}
