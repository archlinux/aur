# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=jellyfin-vue-git
_pkgname=jellyfin-vue
pkgver=r5881.be8b8858
pkgrel=1
pkgdesc='A modern web client for Jellyfin based on Vue'
arch=('any')
url='https://github.com/jellyfin/jellyfin-vue'
license=('GPL3')
makedepends=( # https://github.com/jellyfin/jellyfin-vue/wiki/Contributing#global-prerequisites
  'nodejs>=24.11.0'
  'nodejs<25.0.0'
  'corepack>=0.34.6'
  'git'
)
conflicts=($_pkgname)
backup=("usr/share/jellyfin-vue/config.json")
install="jellyfin-vue.install"
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "$srcdir/$_pkgname/packages/frontend"
  corepack pnpm install --frozen-lockfile
  corepack pnpm build
}

package(){
  cd "$srcdir/$_pkgname"
  install -vd "$pkgdir/usr/share/"
  cp -vr packages/frontend/dist "$pkgdir/usr/share/jellyfin-vue"
}

