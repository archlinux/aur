# Maintainer: Your Name <your.email@example.com>
pkgname=jentlememes-launcher-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='JentleMemes Minecraft launcher (prebuilt binary from GitHub Release tarball)'
arch=('x86_64')
url='https://github.com/rongus760-ship-it/JentleMemes-Launcher'
license=('Apache-2.0' 'MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'gdk-pixbuf2' 'openssl' 'hicolor-icon-theme')
provides=('jentlememes-launcher')
conflicts=('jentlememes-launcher')

# Ассет на GitHub Release для тега v${pkgver} — см. scripts/package-linux-release-tarball.sh
_tarball="jentlememes-launcher-${pkgver}-linux-x86_64.tar.gz"
source=("${_tarball}::${url}/releases/download/v${pkgver}/${_tarball}")

# После пересборки бинарника: npm run package:linux:tarball && cd jentlememes-launcher-bin && updpkgsums
sha256sums=('b17f5978e7adbd2217d5aa1c42c393fef489c83e8dfdc3cc1381a3f73bb3159f')

package() {
  tar -xzf "${srcdir}/${_tarball}" -C "${srcdir}"
  install -Dm755 "${srcdir}/jentlememes-launcher" "${pkgdir}/usr/bin/jentlememes-launcher"
  install -Dm644 "${srcdir}/jentlememes-launcher.desktop" \
    "${pkgdir}/usr/share/applications/jentlememes-launcher.desktop"
}
