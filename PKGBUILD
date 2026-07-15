# Maintainer: Menma736 <mantainer@unrealnetwork.net>
pkgname=unreallauncher-git
pkgver=r1.unknown
pkgrel=1
pkgdesc="Unreal Launcher, launcher made for UnrealStudios needs"
arch=('any')
url="https://github.com/unh0lyalexzero/Unreal-Launcher"
license=('Apache-2.0')
depends=('electron43' 'nodejs')
makedepends=('git' 'npm')
provides=('unreallauncher')
conflicts=('unreallauncher')
source=("unreallauncher-src::git+${url}.git"
        "unreallauncher")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/unreallauncher-src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/unreallauncher-src"
  npm install --production
}

package() {
  install -d "${pkgdir}/usr/share/unreallauncher"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/unreallauncher-src"/* "${pkgdir}/usr/share/unreallauncher/"
  install -m755 "${srcdir}/unreallauncher" "${pkgdir}/usr/bin/unreallauncher"
}

