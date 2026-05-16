# Maintainer: Talha Altinel <talhaaltinel@hotmail.com>

pkgname=keyboard-app
pkgver=0.4.0
pkgrel=2
pkgdesc="Universal on-screen keyboard"
arch=('x86_64')
url="https://github.com/occamist/keyboard-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/occamist/keyboard-app/archive/v${pkgver}.tar.gz")
sha256sums=('510d71ae5b388ece141dea651e0e7b265a38baefe5c096c136b987b654029691')
_commit=('8e175a25396441a628480e55a53df2bfaee37f2e')

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

