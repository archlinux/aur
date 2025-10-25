# Maintainer: Talha Altinel <talhaaltinel@hotmail.com>

pkgname=keyboard-app
pkgver=0.3.0
pkgrel=1
pkgdesc="Universal on-screen keyboard"
arch=('x86_64')
url="https://github.com/mrwormhole/keyboard-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrwormhole/keyboard-app/archive/v${pkgver}.tar.gz")
sha256sums=('df27c4b97f6df6608236b6c5b86c0ed43977e6136904cc866c8fd1e27289555a')
_commit=('d96fe0a656d642348fa16ec24a090164461b87a4')

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

