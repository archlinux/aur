# Maintainer: Reasonance team
pkgname=reasonance
pkgver=0.2.1
pkgrel=1
pkgdesc='Lightweight IDE for vibecoders who work with LLMs'
arch=('x86_64')
url='https://github.com/TNASRLSB/reasonance'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'patchelf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npx tauri build --bundles none
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "reasonance.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
