# Maintainer: gitpocalypse <joepfeiffer16@gmail.com>

pkgname=scene-git
pkgver="0.1.4"
pkgrel=1
pkgdesc="An Urbit ship interface from Tirrel"
arch=('x86_64')
url="https://github.com/tirrel-corp/scene"
license=('LGPL')
makedepends=('git' 'nodejs' 'yarn' 'jq')
provides=()
conflicts=("${pkgname}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    cat package.json | jq .version
}

build() {
  cd "${pkgname}"
  yarn install
  npm run electron:package:linux
}

package() {
  cd "${pkgname}/dist"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/opt/scene
  cp -r ./linux-unpacked/* $pkgdir/opt/scene/
  ln -s $pkgdir/opt/scene/scene $pkgdir/usr/bin/scene
}
