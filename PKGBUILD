# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird
pkgver=2.7.0
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=(i686 x86_64)
url=https://whalebird.org
license=(MIT)
conflicts=(whalebird-bin whalebird-git)
makedepends=(npm)
source=(https://github.com/h3poteto/whalebird-desktop/archive/$pkgver.tar.gz)
sha512sums=('9b0d09e1201c31ba3c4d2cb9bd62c27f482aeb9c4e13faa4c20a40034ae2fdec57deb4355dbec830361aad4b0290522242efc868f44de91cb01f746345050cd8')

build() {
  cd whalebird-desktop-$pkgver
  npm install
  npm run build:dir
}

package() {
  install -d "$pkgdir"/usr/{share,bin}
  cp -a whalebird-desktop-$pkgver/build/linux-unpacked \
    "$pkgdir"/usr/share/whalebird-desktop
  ln -s /usr/share/whalebird-desktop/whalebird "$pkgdir"/usr/bin/whalebird
}
