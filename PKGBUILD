# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=pixsaur
pkgver=0.1.6
pkgrel=1
pkgdesc="Image converter for Amstrad CPC"
url="https://github.com/IIIvan37/pixsaur"
license=('MIT')
arch=('x86_64')
makedepends=('pnpm' 'typescript' 'cargo' 'webkit2gtk-4.1')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IIIvan37/pixsaur/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da50f211f45ac1a57b555bb97335636a036af339b323257d681dfa5435471792')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Install dependencies
  pnpm install
 }

build() {
  cd "${pkgname}-${pkgver}"

  pnpm tauri:build
}

package() {
  depends=('gtk3' 'gdk-pixbuf2' 'cairo' 'libsoup3' 'glib2' 'hicolor-icon-theme' 'webkit2gtk-4.1')

  cd "${pkgname}-${pkgver}"/src-tauri/target/release/bundle/deb/Pixsaur_0.1.6_amd64/data/

  cp -av * ${pkgdir}/

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/"LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
