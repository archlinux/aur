pkgname=omaclip-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Desktop clipboard manager with secure mesh sync — peers auto-discover and share clipboards across your local network"
arch=('x86_64' 'aarch64')
url="https://github.com/rhemvi/omaclip"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
optdepends=(
  'wl-clipboard: Wayland clipboard support'
  'xclip: X11 clipboard support'
)
options=('!debug')
provides=('omaclip')
conflicts=('omaclip')
source_x86_64=("omaclip-linux-amd64-${pkgver}::${url}/releases/download/v${pkgver}/omaclip-linux-amd64")
source_aarch64=("omaclip-linux-arm64-${pkgver}::${url}/releases/download/v${pkgver}/omaclip-linux-arm64")
source=("appicon.png::${url}/releases/download/v${pkgver}/appicon.png"
  "LICENSE::https://raw.githubusercontent.com/rhemvi/omaclip/v${pkgver}/LICENSE"
  "omaclip.desktop")
sha256sums=('d2cc30c8cb442f9d0b73af1a8f8494fb76d92c2abdcff5279cce493a0237061b'
            '436671e03fa1c9439db7bf106dc1b5bb3d9936976029df57d729517c412b8f81'
            '84ae19cfc0f1defbad548c2aade37bdfc417efb1b70070ae72e0d35af4c0bac4')
sha256sums_x86_64=('a676104476970bb8d879aaeb32393aa48d6e1c42da3f96d3495f88bf3a5a28e9')
sha256sums_aarch64=('c083cbfd19837fbfc94e1a19d422093179704389578f84ae32ddbc21b1da31a6')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 omaclip-linux-amd64-${pkgver} "${pkgdir}/usr/bin/omaclip"
  else
    install -Dm755 omaclip-linux-arm64-${pkgver} "${pkgdir}/usr/bin/omaclip"
  fi
  install -Dm644 appicon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omaclip.png"
  install -Dm644 omaclip.desktop "${pkgdir}/usr/share/applications/omaclip.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/omaclip/LICENSE"
}
