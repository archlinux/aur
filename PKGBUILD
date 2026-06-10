# Maintainer: Joschka Thurner <git@joschkathurner.de>
pkgname=docker-sbx
pkgver=0.32.0
pkgrel=1
pkgdesc="Docker sandboxes - run AI coding agents in isolated microVM sandboxes"
arch=('x86_64')
url="https://docs.docker.com/ai/sandboxes/"
license=('LicenseRef-Docker-Proprietary' 'GPL-2.0-only' 'Apache-2.0')
depends=('dbus')
optdepends=(
    'apparmor: AppArmor profile for nerdbox shim confinement (recommended)'
    'gnome-keyring: Keychain for credential storage'
    'keepassxc: Keychain for credential storage'
    'kwallet: Keychain for credential storage')
provides=('sbx')
conflicts=('sbx')
options=('!debug')
source=("https://github.com/docker/sbx-releases/releases/download/v${pkgver}/DockerSandboxes-linux.tar.gz")
sha256sums=('2da12380b1b7669b24ff8b6a1c18097fee89c256c6f50e034efe99e1d7816413')

package() {
    install -Dm755 "$srcdir/docker-sbx/sbx" \
        "$pkgdir/usr/bin/sbx"

    install -Dm755 "$srcdir/docker-sbx/containerd-shim-nerdbox-v1" \
        "$pkgdir/usr/libexec/containerd-shim-nerdbox-v1"
    install -Dm755 "$srcdir/docker-sbx/mkfs.erofs" \
        "$pkgdir/usr/libexec/mkfs.erofs"
    install -Dm644 "$srcdir/docker-sbx/nerdbox-kernel-x86_64" \
        "$pkgdir/usr/libexec/nerdbox-kernel-x86_64"
    install -Dm644 "$srcdir/docker-sbx/nerdbox-initrd-x86_64" \
        "$pkgdir/usr/libexec/nerdbox-initrd-x86_64"
    install -Dm755 "$srcdir/docker-sbx/libsailor.so" \
        "$pkgdir/usr/libexec/lib/libsailor.so"

    install -Dm644 "$srcdir/docker-sbx/apparmor-profile" \
        "$pkgdir/etc/apparmor.d/docker-sbx-nerdbox-shim"

    install -Dm644 "$srcdir/docker-sbx/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/docker-sbx/THIRD-PARTY-NOTICES" \
        "$pkgdir/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
