# Maintainer: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE (previously Kontena Lens)'
pkgver=3.1.0_beta.2
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/lensapp/lens'
makedepends=('nodejs-lts-erbium' 'yarn')
source=("$pkgname-${pkgver/_/-}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver/_/-}.tar.gz"
        "lens.desktop")
sha256sums=('ea3e5059164186cc0a559bb964633175f9199744b43eac908933f353730cfb9f'
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
