# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.0.223
pkgrel=4
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

case "$CARCH" in
  x86_64) _pkgarch="amd64" ;;
  aarch64) _pkgarch="arm64" ;;
esac

source=(
  "${pkgname}-${pkgver}.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-${_pkgarch}.deb"
  "LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/dev/LICENSE"
)
case "$CARCH" in
  x86_64) sha256sums=('4090c531df6c87a19e6329701f2d6467ce19c6fd6e8950ae4d4666d4b43ddaa2'
                       '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b') ;;
  aarch64) sha256sums=('4b0ba40de789b9c33f49b49a8af573eeadff30d85519a64bcb1bc522463c3522'
                        '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b') ;;
esac

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('bf5666f2b50ed12083b20fce859e63495470e0ea0ebf0e74f91773cbd16f1671'
            '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
