# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=bdash
pkgver=1.5.6
pkgrel=1
pkgdesc='Simple business intelligence application'
arch=('x86_64')
url='https://github.com/bdash-app/bdash'
license=('MIT')
options=('!strip')
makedepends=('node-gyp' 'python2' 'python' 'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdash-app/bdash/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  yarn install --no-progress
  yarn run webpack --env.BUILD_ENV=production
  yarn run electron-builder build --linux AppImage --x64
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "$pkgname-$pkgver/dist/production/Bdash-$pkgver-x86_64.AppImage" "$pkgdir/usr/bin/bdash"
}

# vim: set ft=sh:

sha512sums=('1d01d3979d34958251b56836254ed8044e8b3ec870e926335bd1d9ef661d8ed34c56a9ce711d6601343a969c3805fcccd01ca245b978d137f4cf83dff0263268')
