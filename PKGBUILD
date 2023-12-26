# Maintainer: Alfonso Reyes <hola@alfon.so>
pkgname=heynote-git
pkgver=1.4.2
pkgrel=4
pkgdesc="A dedicated scratchpad for developers"

arch=('any')
url="https://github.com/heyman/heynote"
license=('MIT')

depends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=(
  "6a4efec095ef0d2676ea7f93238430f8c56d3c57426bf9711dfd057d97a1eb4e"
)

build() {
  # Clone the repo
  git clone "$url" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  npm install -g npm@latest
  # Install dependencies
  npm install --quiet
  # Build the app
  npm run build
}

package() {
  cd "$pkgname-$pkgver"
  # copy content from release folder to /usr/share
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r release/$pkgver/linux-unpacked/* "$pkgdir/usr/share/$pkgname"
  cp resources/icon.png "$pkgdir/usr/share/$pkgname/icon.png"
  # copy .desktop file to /usr/share/applications
  mkdir -p "$pkgdir/usr/share/applications"
  cp -a ../../heynote.desktop "$pkgdir/usr/share/applications"
}
