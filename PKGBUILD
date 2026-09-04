# Maintainer: 5p00kyy <admin@5p00ky.dev>

pkgname=openclaw-desktop-bin
pkgver=2026.8.2
pkgrel=1
pkgdesc='OpenClaw Linux desktop companion (prebuilt binary)'
arch=('x86_64')
url='https://github.com/openclaw/openclaw'
license=('MIT')
depends=(
  'bash'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
optdepends=('openclaw: use an existing system CLI for local Gateway management')
options=('!debug' '!strip')
source=(
  "OpenClaw-${pkgver}-amd64.deb::https://github.com/openclaw/openclaw/releases/download/v${pkgver}/OpenClaw-${pkgver}-amd64.deb"
  "openclaw-upstream-license::https://raw.githubusercontent.com/openclaw/openclaw/v${pkgver}/LICENSE"
)
noextract=("OpenClaw-${pkgver}-amd64.deb")
sha256sums=(
  '6021ac38b398fc3b4c1364f72fb83a5d89e2d6c20ed6bbe6d3ceed0cddbeaa85'
  '73571b25326281d369087f469842c02444fe39faaecebda4d82ed21ff3a1c29d'
)

package() {
  bsdtar -xOf "${srcdir}/OpenClaw-${pkgver}-amd64.deb" data.tar.gz | bsdtar -xpf - -C "${pkgdir}"
  install -Dm644 "${srcdir}/openclaw-upstream-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
