# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.0.206
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop')
depends=('gtk3' 'webkit2gtk-4.1' 'desktop-file-utils' 'hicolor-icon-theme')
options=('!strip' '!debug')

latestver() {
  curl -s "https://api.github.com/repos/sst/opencode/releases/latest" |
    jq -r '.tag_name' | sed 's/^v//'
}

case "$CARCH" in
  x86_64) _pkgarch="amd64" ;;
  aarch64) _pkgarch="arm64" ;;
esac

source=(
  "${pkgname}-${pkgver}.deb::https://github.com/sst/opencode/releases/download/v${pkgver}/opencode-desktop-linux-${_pkgarch}.deb"
  "LICENSE::https://raw.githubusercontent.com/sst/opencode/dev/LICENSE"
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

sha256sums=('f3f85065070ba16acd2717eb462422a39af8b6dd19c973fe7e3f05e8cd3dfa9c'
            '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
