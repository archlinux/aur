# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=zerotwo
pkgver=0.6.2+beta
pkgrel=1
pkgdesc='AniList Anime tracker written with Electron & Vue.js'
arch=(i686 x86_64)
url=https://www.zerotwo.org
license=(GPL3)
conflicts=(zerotwo-bin zerotwo-git)
makedepends=(npm)
source=(https://github.com/NicoAiko/zerotwo/archive/v${pkgver/+/-}.tar.gz)
sha512sums=('077efb8bbdf2dd86366fc61aa985521c04f316c3ba0e6ac7439332c35f423a37008d0a0ee3b75b89669533861c36cebf81d5bc018526d8dd5257e01477e07396')

build() {
  cd zerotwo-${pkgver/+/-}
  npm i
  NODE_ENV=production \
    ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true \
    npm run build:dir
}

package() {
  install -d "$pkgdir"/usr/{share,bin}
  cp -a zerotwo-${pkgver/+/-}/build/linux-unpacked \
    "$pkgdir"/usr/share/zerotwo
  ln -s /usr/share/zerotwo/zerotwo-ui "$pkgdir"/usr/bin/zerotwo
}
