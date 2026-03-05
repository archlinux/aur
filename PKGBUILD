# Maintainer: dbctl@pm.me
pkgname=proton-drive-sync-prerelease-bin
pkgver=0.2.5beta.2
pkgrel=1
pkgdesc='Sync local directories to Proton Drive cloud storage (prerelease)'
arch=('x86_64' 'aarch64')
url='https://github.com/DamianB-BitFlipper/proton-drive-sync'
license=('GPL-3.0-only')
depends=('libsecret')
provides=('proton-drive-sync')
conflicts=('proton-drive-sync' 'proton-drive-sync-bin')
options=('!strip' '!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.5-beta.2/proton-drive-sync-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DamianB-BitFlipper/proton-drive-sync/releases/download/v0.2.5-beta.2/proton-drive-sync-linux-arm64.tar.gz")
sha256sums_x86_64=('0a6960aa8db479fe62b91efb02d5dd45ee90f6df00dfb41ca113f20fe5c31e22')
sha256sums_aarch64=('f157c6c87700f1d482edcd6ed4c3af0685584b0571d76ba63950ec8f18c628fb')

package() {
    # Bun-compiled binaries store application code appended after the ELF.
    # Stripping removes this data, breaking the binary. Override STRIP as a
    # safeguard in case the user's makepkg.conf enables strip globally.
    export STRIP=/usr/bin/true

    install -Dm755 proton-drive-sync "${pkgdir}/usr/bin/proton-drive-sync"
}
