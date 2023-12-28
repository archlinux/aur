# Maintainer: Alfonso Reyes <hola@alfon.so>
pkgname=heynote-git
pkgver=1.5.0
pkgrel=1
pkgdesc="A dedicated scratchpad for developers"

gitPackageName="heynote"

arch=('any')
url="https://github.com/heyman/heynote"
license=('MIT')

depends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=(
  "d70159d192e93014e3880c7f2488e1ae09845945405d82d2498b680b1166b8c8"
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
