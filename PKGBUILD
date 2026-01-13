# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.1.14
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop')
depends=('gtk3' 'webkit2gtk-4.1' 'desktop-file-utils' 'hicolor-icon-theme' 'gst-plugins-good')
options=('!strip' '!debug')

latestver() {
  curl -fsSL "https://api.github.com/repos/anomalyco/opencode/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

source_x86_64=(
  "opencode-linux-x64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-linux-x64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/dev/LICENSE"
)
sha256sums_x86_64=('9d40850a0bfc836d84e2fea0074ff42e5b8bf0dc3259d53dd4f17296c87cc417'
                   '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_aarch64=('5f468dc996e72a81a636f63c5df057a4a3ff24ecef95fab99f93fb12defb09a0'
                    '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')

source_aarch64=(
  "opencode-linux-arm64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-linux-arm64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/dev/LICENSE"
)

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp -a "${srcdir}/opencode" "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
