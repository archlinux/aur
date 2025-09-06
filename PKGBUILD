# Maintainer: Talha Altinel <talhaaltinel@hotmail.com>

pkgname=keyboard-app
pkgver=0.2.0
pkgrel=1
pkgdesc="Cross-platform on-screen keyboard for different languages"
arch=('x86_64')
url="https://github.com/mrwormhole/keyboard-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrwormhole/keyboard-app/archive/v${pkgver}.tar.gz")
sha256sums=('5f19e9e9f3dcc6f6d83e91fdef9e8e06f09f85df5171d24679fa4a8447bba867')
_commit=('f2aef164a53a3aadea47a15362527c9138cec456')

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

