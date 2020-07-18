# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=bdash
pkgver=1.8.3
pkgrel=1
pkgdesc='Simple business intelligence application'
arch=('x86_64')
url='https://github.com/bdash-app/bdash'
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
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

sha512sums=('bb8c4c79e53d16fd45f6ee00839ddaaa401c670adbc2bcc8263c19afa6e07094888ba9ff8cee042a9536c53dd35e1160fb388f46b5b2fc8798dc871f600c506c')
