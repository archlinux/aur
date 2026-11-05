# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>
# AUR history recovery: aur-maintainer backs up and removes oversized legacy blobs before publishing.
pkgname=vega-cli-bin
_pkgname=vega
pkgver=1.4.8
pkgrel=1
pkgdesc="Amazon Vega CLI (KeplerVersionManager) — installs and manages the Vega SDK in \$HOME/vega"
arch=('x86_64')
url="https://developer.amazon.com/docs/vega/latest/install-vega-sdk.html"
license=('custom:Amazon-PML')
depends=('curl' 'tar' 'gzip' 'lz4' 'nodejs')
optdepends=(
    'python38: required by parts of the Vega SDK toolchain (AUR)'
    'watchman: file watcher used by the Vega dev tools'
    'qemu-base: KVM virtualization for the Vega emulator'
    'visual-studio-code-bin: recommended editor with Vega Studio extension'
)
provides=('vega' 'kepler' 'vvman')
conflicts=('vega' 'kepler' 'vvman')
options=(!strip !debug)
_sha256=d855d35c7202da1c626499a8ed48c4e75f29cb982a359861af2b7063ea8bf2d4
source=("vega-1.4.8-linux-x86_64.tar.gz::https://kepler-static-artifacts.kepler.labcollab.net/d8/d855d35c7202da1c626499a8ed48c4e75f29cb982a359861af2b7063ea8bf2d4")
sha256sums=('d855d35c7202da1c626499a8ed48c4e75f29cb982a359861af2b7063ea8bf2d4')
install="${pkgname}.install"

package() {
    install -Dm755 "${srcdir}/vega" "${pkgdir}/usr/bin/vega"

    # Backward-compatibility names the upstream installer also creates.
    ln -s vega "${pkgdir}/usr/bin/kepler"
    ln -s vega "${pkgdir}/usr/bin/vvman"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
The Vega CLI is distributed by Amazon under the Program Materials License
Agreement. See https://developer.amazon.com/support/legal/pml for the full
terms. This PKGBUILD only repackages the upstream binary for Arch Linux; it
does not modify it.
EOF
}
