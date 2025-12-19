# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.0.170
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64')
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

source=(
  "${pkgname}-${pkgver}.deb::https://github.com/sst/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/sst/opencode/dev/LICENSE"
)
sha256sums=('29757ff0e7ff7c79f20c314190e5b238c81bfc39282631c514d295b34cc17708'
            '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

