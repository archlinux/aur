# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=ppd-editor
pkgver=0.1.0
pkgrel=1
pkgdesc="Editor for 2D paperdoll file"
arch=('any')
url="https://github.com/fralonra/ppd-editor"
license=('MIT')
makedepends=('rust' 'git')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('1ea54fdfa4063841ed2153ccf2267179')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GIT_COMMIT_HASH=$(git rev-parse --short HEAD) cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/ppd-editor        "$pkgdir/usr/bin/ppd-editor"
  install -Dm755 target/release/ppd-viewer        "$pkgdir/usr/bin/ppd-viewer"
  install -Dm644 build/linux/PpdEditor.desktop    "$pkgdir/usr/share/applications/io.github.fralonra.PpdEditor.desktop"
  install -Dm644 build/linux/PpdViewer.desktop    "$pkgdir/usr/share/applications/io.github.fralonra.PpdViewer.desktop"
  install -Dm644 build/logo/ppd-editor.svg         "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.fralonra.PpdEditor.svg"
  install -Dm644 build/logo/ppd-viewer.svg         "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.fralonra.PpdViewer.svg"
}
