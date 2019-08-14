# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=bdash
pkgver=1.5.7
pkgrel=1
pkgdesc='Simple business intelligence application'
arch=('x86_64')
url='https://github.com/bdash-app/bdash'
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'gconf')
makedepends=('node-gyp' 'python' 'yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdash-app/bdash/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  yarn install --no-progress
  yarn run webpack --env.BUILD_ENV=production
  yarn run electron-builder build --linux dir --x64
}

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  mv "$pkgname-$pkgver/dist/production/linux-unpacked" "$pkgdir/opt/bdash"
  ln -s /opt/bdash/bdash "$pkgdir/usr/bin/bdash"
}

# vim: set ft=sh:

sha512sums=('008e1a9081312bbc7ddbff4a966861f49673d050aff7a0ea75fc1a9cfb207de90d876ab3b64af64378237725be95fa3c0b09fc3a0984a6a10738e8e6cf368edc')
