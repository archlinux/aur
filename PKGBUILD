# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=zerotwo-git
pkgver=0.6.2+beta
pkgrel=1
pkgdesc='AniList Anime tracker written with Electron & Vue.js (git)'
arch=(i686 x86_64)
url=https://www.zerotwo.org
license=(GPL3)
conflicts=(zerotwo zerotwo-bin)
makedepends=(git npm)
source=(git+https://github.com/NicoAiko/zerotwo)
sha512sums=('SKIP')

pkgver() {
  cd zerotwo
  git describe --tags | sed 's#v##;s#-#+#'
}

build() {
  cd zerotwo
  npm i
  NODE_ENV=production \
    ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true \
    npm run build:dir
}

package() {
  install -d "$pkgdir"/usr/{share,bin}
  cp -a zerotwo/build/linux-unpacked \
    "$pkgdir"/usr/share/zerotwo
  ln -s /usr/share/zerotwo/zerotwo-ui "$pkgdir"/usr/bin/zerotwo
}
