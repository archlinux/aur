# Maintainer: Alfonso Reyes <hola@alfon.so>
pkgname=heynote-git
pkgver=1.7.0
pkgrel=1
pkgdesc="A dedicated scratchpad for developers"

gitPackageName="heynote"

arch=('any')
url="https://github.com/heyman/heynote"
license=('MIT')

# build dependencies
makedepends=('npm')
depends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=(
  "1f00f56f81685505c6d96729149607fe70a65b3f917aeecb37f94c7dc39c72dd"
)

build() {
  cd $gitPackageName-$pkgver
  npm install -g npm@latest
  # Install dependencies
  npm install --quiet
  # Build the app
  npm run build
}

package() {
  cd "$gitPackageName-$pkgver"
  # copy content from release folder to /usr/share
  mkdir -p "$pkgdir/usr/share/$gitPackageName"
  cp -r release/$pkgver/linux-unpacked/* "$pkgdir/usr/share/$gitPackageName"
  cp resources/icon.png "$pkgdir/usr/share/$gitPackageName/icon.png"
  # copy .desktop file to /usr/share/applications
  mkdir -p "$pkgdir/usr/share/applications"
  cp -a ../../heynote.desktop "$pkgdir/usr/share/applications"
}
