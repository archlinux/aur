pkgname=openwork
pkgver=0.11.164
pkgrel=1 # pkgrel should change when PKGBUILD does. Standard is to change back to 1 next time. Any interger is valid.
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64' 'aarch64')
url="https://github.com/different-ai/openwork"
license=('MIT')
# webkit2gtk-4.1 provides both webkit2gtk-4.1.pc and javascriptcoregtk-4.1.pc
depends=('gtk3' 'glib2' 'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1' 'openssl' 'dbus' 'librsvg')

# Architecture-specific sources and checksums
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums_x86_64=('940b03004dea31a478955049689c95a6c4657a37cc0219c9b27e369b05c4a684')

source_aarch64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-arm64.deb")
sha256sums_aarch64=('8140d03456cc9bb09f4f7ca502453ca29f828f543c0475abeffe0b33cf882800')

# Makes sure makepkg doesn't extract the .deb since it will break
noextract=("${pkgname}-${pkgver}.deb")

package() {
  # cd cwd
  cd "${srcdir}"

  # Extract the internal data archive directly to the cwd.
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
}

# .deb Internal Structure Reference:
# └── openwork-desktop-linux-amd64.deb
#     ├── debian-binary
#     ├── control.tar.zst
#     └── data.tar.zst (Extracted to $pkgdir)
#         ├── opt/openwork/ (App files)
#         └── usr/bin/
#             ├── opencode (Terminal agent)
#             └── openwork (GUI launcher)
