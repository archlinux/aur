# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird-git
pkgver=2.7.5+r1+gae56ef4
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client (git)'
arch=(i686 x86_64)
url=https://whalebird.org
license=(MIT)
provides=(whalebird)
conflicts=(whalebird whalebird-bin)
makedepends=(git npm)
source=(git+https://github.com/h3poteto/whalebird-desktop)
sha512sums=('SKIP')

pkgver() {
  cd whalebird-desktop
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd whalebird-desktop
  npm install
  npm run build
  npx electron-builder --dir
}

package() {
  install -d "$pkgdir"/usr/{share,bin}
  cp -a whalebird-desktop/build/linux-unpacked \
    "$pkgdir"/usr/share/whalebird-desktop
  ln -s /usr/share/whalebird-desktop/whalebird "$pkgdir"/usr/bin/whalebird
}
