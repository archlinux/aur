# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>
pkgname=vega-cli-bin
_pkgname=vega
pkgver=1.3.4
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
_sha256="2fa7c110b21e71254dba2b5b8da6e5c2fcc8637bc20ccbc14f6175fa2c6f7285"
source=("vega-${pkgver}-linux-x86_64.tar.gz::https://kepler-static-artifacts.kepler.labcollab.net/${_sha256:0:2}/${_sha256}")
sha256sums=("${_sha256}")
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
