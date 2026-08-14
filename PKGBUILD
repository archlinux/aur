# Maintainer: j4y <j4y_w4lk3r@pobox.com>
#
# pikvm-bin: pre-built AUR package for the pikvm CLI/TUI. Pulls the
# .tar.gz release artifact from GitHub (the same one the Homebrew tap
# consumes) so AUR users get the exact same binary.
#
# To bump after a new GitHub release:  make aur-bump VER=<new-version>

pkgname=pikvm-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="PiKVM ATX power control — terminal UI and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/j4y-w4lk3r/pikvm"
license=('MIT')
provides=('pikvm')
conflicts=('pikvm')
optdepends=(
    '1password-cli: auto-load pikvm1/pikvm2 credentials from 1Password'
    'tailscale: resolve PiKVM host IPs from the tailnet'
    'fzf: fuzzy port/iso/script picker'
    'ffmpeg: ffplay HDMI stream view'
    'mpv: alternate HDMI stream view'
    'chafa: snapshot thumbnails (future grid view)'
)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/pikvm_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/pikvm_${pkgver}_linux_arm64.tar.gz")

# Replaced by `makepkg --skipinteg` during initial bootstrap; the real
# checksums get filled in by `make aur-bump` for every release.
sha256sums_x86_64=('43fe2eca840e8899d9eafc84cce97b715d22838ec70d2ff287f4e1fe158f5dc8')
sha256sums_aarch64=('dffe889d7710a7479080082e36b72adc8c12edb66f2562557f3056577c923c2f')

package() {
    install -Dm755 "${srcdir}/pikvm" "${pkgdir}/usr/bin/pikvm"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/ROADMAP.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
}
