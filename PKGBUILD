# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird
pkgver=2.7.5
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=(i686 x86_64)
url=https://whalebird.org
license=(MIT)
makedepends=(npm)
source=(https://github.com/h3poteto/whalebird-desktop/archive/$pkgver.tar.gz)
sha512sums=('a9a605dadf84133e218f6769158fba333acb0f83fda229cedb77ed8332667625e3ff36a49754d7e465eadfaf180f1d645f6a137f5d63d3fd9188b3ea01bff12a')

build() {
  cd whalebird-desktop-$pkgver
  npm install
  npm run build
  npx electron-builder --dir
}

package() {
  install -d "$pkgdir"/usr/{share,bin}
  cp -a whalebird-desktop-$pkgver/build/linux-unpacked \
    "$pkgdir"/usr/share/whalebird-desktop
  ln -s /usr/share/whalebird-desktop/whalebird "$pkgdir"/usr/bin/whalebird
}
