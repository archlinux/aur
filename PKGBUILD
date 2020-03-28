# Maintainer: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE (previously Kontena Lens)'
pkgver=3.1.0_rc.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/lensapp/lens'
makedepends=('nodejs-lts-erbium' 'yarn')
source=("$pkgname-${pkgver/_/-}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver/_/-}.tar.gz"
        "lens.desktop")
sha256sums=('e7c6ea5ca074373625760f2d142fe15a362ab1c644a95f235f6b97643f862586'
            'e81c76d6ae2703c35a6e5d93830402f7a02a4f7bf19a06c91495b2ab52c56c94')

build() {
  cd $pkgname-${pkgver/_/-}

  make build
}

package() {
  # Copy the entire distribution to /opt
  install -d "$pkgdir"/opt/$pkgname
  cp -a "$srcdir"/$pkgname-${pkgver/_/-}/dist/linux-unpacked/* "$pkgdir"/opt/$pkgname

  # Icon
  install -Dm 644 "$srcdir"/$pkgname-${pkgver/_/-}/build/icons/512x512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png

  # Desktop file
  install -Dm 644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Symlink binary
  install -d "$pkgdir"/usr/bin/$pkgname
  ln -s "$pkgdir"/opt/$pkgname/kontena-lens "$pkgdir"/usr/bin/
}
