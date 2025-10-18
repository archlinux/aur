pkgname=streambooru-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="StreamBooru — cross‑platform Electron app to browse multiple booru sites"
arch=('x86_64')
url="https://github.com/Amateur-God/StreamBooru"
license=('GPL3')

depends=('alsa-lib' 'nss' 'gtk3' 'libxss' 'libxtst')
optdepends=(
  'libappindicator-gtk3: tray icon support'
  'libnotify: desktop notifications'
  'xdg-utils: open links with xdg-open'
)

provides=('streambooru')
conflicts=('streambooru')

source=(
  "https://github.com/Amateur-God/StreamBooru/releases/download/v${pkgver}/StreamBooru-${pkgver}.tar.gz"
  "streambooru.sh"
  "streambooru.desktop"
)
sha256sums=(
  '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
  'SKIP'
  'SKIP'
)

package() {
  install -d "${pkgdir}/opt/streambooru-bin" \
             "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/share/applications"

  tar -xzf "${srcdir}/StreamBooru-${pkgver}-linux-x64.tar.gz" \
      -C "${pkgdir}/opt/streambooru-bin" --strip-components=1

  # Electron sandbox helper (if present)
  if [[ -f "${pkgdir}/opt/streambooru-bin/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/streambooru-bin/chrome-sandbox" || true
  fi

  install -Dm755 "${srcdir}/streambooru.sh" "${pkgdir}/usr/bin/streambooru"
  ln -s streambooru "${pkgdir}/usr/bin/streambooru-bin"

  install -Dm644 "${srcdir}/streambooru.desktop" "${pkgdir}/usr/share/applications/streambooru.desktop"
}
