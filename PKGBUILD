# Maintainer: Alfonso Reyes <hola@alfon.so>
pkgname=heynote-git
pkgver=1.6.0
pkgrel=1
pkgdesc="A dedicated scratchpad for developers"

gitPackageName="heynote"

arch=('any')
url="https://github.com/heyman/heynote"
license=('MIT')

depends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=(
  "bf1836a488006d01140db2c428b9c6802216a4ac3bebe4ab80d2061ce1be1bae"
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
