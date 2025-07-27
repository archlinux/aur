# Maintainer: Talha Altinel <talhaaltinel@hotmail.com>

pkgname=keyboard-app
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform on-screen keyboard for different languages"
arch=('x86_64')
url="https://github.com/mrwormhole/keyboard-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrwormhole/keyboard-app/archive/v${pkgver}.tar.gz")
sha256sums=('d22b0eda5866d3f50dbb912a7f983d0557304be37c6761571bd19b2f513f38fa')
_commit=('439ab6def5db75098e1d3df64359de983677c325')

build() {
  cd "$pkgname-$pkgver"
  
  pnpm install
  pnpm tauri build -b deb
}

package() {
  cp -a ${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

