# Maintainer: Kaylin Aurora <kaylin@cmdly.dev>
pkgname=aria-fm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Spotify desktop client — Go + Wails3 + librespot, FFI-first transport"
arch=('x86_64')
url="https://gitlab.com/cmdly/aria.fm"
license=('MIT')
# Runtime libs the binary links: the Wails GUI (gtk4 + webkitgtk-6.0 +
# libsoup3), oto audio (alsa-lib), and librespot's openssl-sys (openssl).
# The librespot cdylib is embedded in the binary, so no sidecar.
depends=('gtk4' 'webkitgtk-6.0' 'libsoup3' 'alsa-lib' 'openssl')
provides=('aria.fm')
conflicts=('aria.fm')
# Binary is already stripped at build (-ldflags "-s -w").
options=('!strip')
source=("aria-${pkgver}.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria/v${pkgver}/aria-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e3f4ddd96250efe970f24091d433de55f18a602b3ed42e5fb14c21f0d86d5884')

package() {
  cd "${srcdir}/aria-v${pkgver}-linux-x86_64"
  install -Dm755 aria "${pkgdir}/usr/bin/aria"
  install -Dm644 aria.desktop "${pkgdir}/usr/share/applications/aria.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
