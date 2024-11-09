# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=jellyfin-vue-git
_pkgname=jellyfin-vue
pkgver=r5325.32fb1c7f
pkgrel=1
pkgdesc='A modern web client for Jellyfin based on Vue'
arch=('any')
url='https://github.com/jellyfin/jellyfin-vue'
license=('GPL3')
makedepends=(
  'nodejs>=22.11.0'
  'nodejs<23.0.0'
  'npm>=10.9.0'
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
  # Build jellyfin-web
  cd "$srcdir/$_pkgname/frontend"
  npm install
  npm run build
}

package(){
  cd "$srcdir/$_pkgname"
  install -vd "$pkgdir/usr/share/"
  cp -vr frontend/dist "$pkgdir/usr/share/jellyfin-vue"
}

